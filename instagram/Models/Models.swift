//
//  Models.swift
//  instagram
//
//  Created by Irvan Mahardhika on 07/04/21.
//

import Foundation

// added
public enum UserPostType {
    case photo, video
}

enum Gender {
    case male, female
}

struct UserCount {
    let followers:Int
    let following:Int
    let posts:Int
}

struct User {
    let username:String
    let bio:String
    let name:(first:String, last:String)
    let birthDate:Date
    let gender:Gender
    let counts:UserCount
    let joinDate:Date
}

public struct UserPost {
    let identifier:String
    let postType:UserPostType
    let thumbnailImage:URL
    let postURL:URL
    let caption:String?
    let likedCount:[PostLikes]
    let comments: [PostComment]
    let createdDate:Date
    let taggedUsers:[User]
}

struct PostLikes {
    let username:String
    let postIdentifier:String
}

struct CommentLikes {
    let username:String
    let commentIdentifier:String
}

struct PostComment {
    let identifier:String
    let username:String
    let text:String
    let createdDate:Date
    let likes:[CommentLikes]
}
//
