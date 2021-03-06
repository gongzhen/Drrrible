//
//  CompositionRoot.swift
//  Drrrible
//
//  Created by Suyeol Jeon on 16/08/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import Kingfisher
import Umbrella

final class CompositionRoot {
  /// Builds a dependency graph and returns an entry view controller.
  static func rootViewController() -> SplashViewController {
    let authService = AuthService()
    let networking = DrrribleNetworking(plugins: [AuthPlugin(authService: authService)])
    let appStoreService = AppStoreService()
    let userService = UserService(networking: networking)
    let shotService = ShotService(networking: networking)

    let analytics = DrrribleAnalytics()
    analytics.register(provider: FirebaseProvider())

    URLNavigationMap.initialize(authService: authService)

    let productionImageOptions: ImageOptions = []

    var presentMainScreen: (() -> Void)!
    var presentLoginScreen: (() -> Void)!
    presentMainScreen = {
      let shotListViewReactor = ShotListViewReactor(
        shotService: shotService,
        shotCellReactorFactory: ShotCellReactor.init
      )
      let shotSectionReactorFactory: (Int, Shot?) -> ShotSectionReactor = { shotID, shot in
        ShotSectionReactor(
          shotID: shotID,
          shot: shot,
          reactionCellReactorFactory: { shot in
            ShotViewReactionCellReactor(
              shot: shot,
              likeButtonViewReactorFactory: { shot in
                ShotViewReactionLikeButtonViewReactor(
                  shot: shot,
                  shotService: shotService,
                  analytics: analytics
                )
              },
              commentButtonViewReactorFactory: { shot in
                ShotViewReactionCommentButtonViewReactor(shot: shot)
              }
            )
          }
        )
      }
      let shotTileCellDependency = ShotTileCell.Dependency(
        imageOptions: productionImageOptions,
        shotViewControllerFactory: { id, shot in
          let reactor = ShotViewReactor(
            shotID: id,
            shot: shot,
            shotService: shotService,
            shotSectionReactorFactory: shotSectionReactorFactory
          )
          return ShotViewController(
            reactor: reactor,
            analytics: analytics,
            shotSectionDelegateFactory: {
              ShotSectionDelegate(
                imageCellDependency: .init(imageOptions: productionImageOptions),
                titleCellDependency: .init(imageOptions: productionImageOptions)
              )
            }
          )
        }
      )
      let shotListViewController = ShotListViewController(
        reactor: shotListViewReactor,
        analytics: analytics,
        shotTileCellDependency: shotTileCellDependency
      )
      let mainTabBarController = MainTabBarController(
        reactor: MainTabBarViewReactor(),
        shotListViewController: shotListViewController,
        settingsViewController: SettingsViewController(
          reactor: SettingsViewReactor(userService: userService),
          analytics: analytics,
          versionViewControllerFactory: {
            let reactor = VersionViewReactor(appStoreService: appStoreService)
            return VersionViewController(reactor: reactor)
          },
          presentLoginScreen: presentLoginScreen
        )
      )
      AppDelegate.shared.window?.rootViewController = mainTabBarController
    }
    presentLoginScreen = {
      let reactor = LoginViewReactor(authService: authService, userService: userService)
      AppDelegate.shared.window?.rootViewController = LoginViewController(
        reactor: reactor,
        analytics: analytics,
        presentMainScreen: presentMainScreen
      )
    }

    let reactor = SplashViewReactor(userService: userService)
    let splashViewController = SplashViewController(
      reactor: reactor,
      presentLoginScreen: presentLoginScreen,
      presentMainScreen: presentMainScreen
    )
    return splashViewController
  }
}
