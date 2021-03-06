//
//  CommentFixture.swift
//  Drrrible
//
//  Created by Suyeol Jeon on 26/07/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import Foundation
import ObjectMapper
@testable import Drrrible

struct CommentFixture {
  static let comment1 = try! Comment(JSON: [
    "id" : 1145736,
    "body" : "<p>Could he somehow make the shape of an \"S\" with his arms? I feel like i see potential for some hidden shapes in here...</p>\n\n<p>Looks fun!\n</p>",
    "likes_count" : 1,
    "likes_url" : "https://api.dribbble.com/v1/shots/471756/comments/1145736/likes",
    "created_at" : "2012-03-15T04:24:39Z",
    "updated_at" : "2012-03-15T04:24:39Z",
    "user" : [
      "id" : 1,
      "name" : "Dan Cederholm",
      "username" : "simplebits",
      "html_url" : "https://dribbble.com/simplebits",
      "avatar_url" : "https://d13yacurqjgara.cloudfront.net/users/1/avatars/normal/dc.jpg?1371679243",
      "bio" : "Co-founder &amp; designer of <a href=\"https://dribbble.com/dribbble\">@Dribbble</a>. Principal of SimpleBits. Aspiring clawhammer banjoist.",
      "location" : "Salem, MA",
      "links" : [
        "web" : "http://simplebits.com",
        "twitter" : "https://twitter.com/simplebits"
      ],
      "buckets_count" : 10,
      "comments_received_count" : 3395,
      "followers_count" : 29262,
      "followings_count" : 1728,
      "likes_count" : 34954,
      "likes_received_count" : 27568,
      "projects_count" : 8,
      "rebounds_received_count" : 504,
      "shots_count" : 214,
      "teams_count" : 1,
      "can_upload_shot" : true,
      "type" : "Player",
      "pro" : true,
      "buckets_url" : "https://dribbble.com/v1/users/1/buckets",
      "followers_url" : "https://dribbble.com/v1/users/1/followers",
      "following_url" : "https://dribbble.com/v1/users/1/following",
      "likes_url" : "https://dribbble.com/v1/users/1/likes",
      "shots_url" : "https://dribbble.com/v1/users/1/shots",
      "teams_url" : "https://dribbble.com/v1/users/1/teams",
      "created_at" : "2009-07-08T02:51:22Z",
      "updated_at" : "2014-02-22T17:10:33Z"
    ]
  ])
  static let comment2 = try! Comment(JSON: [
    "id" : 24400091,
    "body": "Hello, world!",
    "likes_count" : 1,
    "likes_url" : "https://api.dribbble.com/v1/shots/471756/comments/1145736/likes",
    "created_at" : "2012-03-15T04:24:39Z",
    "updated_at" : "2012-03-15T04:24:39Z",
    "user" : [
      "id" : 1,
      "name" : "Dan Cederholm",
      "username" : "simplebits",
      "html_url" : "https://dribbble.com/simplebits",
      "avatar_url" : "https://d13yacurqjgara.cloudfront.net/users/1/avatars/normal/dc.jpg?1371679243",
      "bio" : "Co-founder &amp; designer of <a href=\"https://dribbble.com/dribbble\">@Dribbble</a>. Principal of SimpleBits. Aspiring clawhammer banjoist.",
      "location" : "Salem, MA",
      "links" : [
        "web" : "http://simplebits.com",
        "twitter" : "https://twitter.com/simplebits"
      ],
      "buckets_count" : 10,
      "comments_received_count" : 3395,
      "followers_count" : 29262,
      "followings_count" : 1728,
      "likes_count" : 34954,
      "likes_received_count" : 27568,
      "projects_count" : 8,
      "rebounds_received_count" : 504,
      "shots_count" : 214,
      "teams_count" : 1,
      "can_upload_shot" : true,
      "type" : "Player",
      "pro" : true,
      "buckets_url" : "https://dribbble.com/v1/users/1/buckets",
      "followers_url" : "https://dribbble.com/v1/users/1/followers",
      "following_url" : "https://dribbble.com/v1/users/1/following",
      "likes_url" : "https://dribbble.com/v1/users/1/likes",
      "shots_url" : "https://dribbble.com/v1/users/1/shots",
      "teams_url" : "https://dribbble.com/v1/users/1/teams",
      "created_at" : "2009-07-08T02:51:22Z",
      "updated_at" : "2014-02-22T17:10:33Z"
    ]
  ])
}
