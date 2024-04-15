//
//  PhotoResponseModel.swift
//  PhotoListApp
//
//  Created by techstalwarts on 13/04/24.
//

import Foundation


struct PhotoResponseModel : Codable {
    let id : String?
    let slug : String?
    let alternative_slugs : Alternative_slugs?
    let created_at : String?
    let updated_at : String?
    let promoted_at : String?
    let width : Int?
    let height : Int?
    let color : String?
    let blur_hash : String?
    let description : String?
    let alt_description : String?
    let breadcrumbs : [Breadcrumbs]?
    let urls : Urls?
    let links : Links?
    let likes : Int?
    let liked_by_user : Bool?
    let current_user_collections : [String]?
    let sponsorship : String?
    let topic_submissions : Topic_submissions?
    let asset_type : String?
    let user : User?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case slug = "slug"
        case alternative_slugs = "alternative_slugs"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case promoted_at = "promoted_at"
        case width = "width"
        case height = "height"
        case color = "color"
        case blur_hash = "blur_hash"
        case description = "description"
        case alt_description = "alt_description"
        case breadcrumbs = "breadcrumbs"
        case urls = "urls"
        case links = "links"
        case likes = "likes"
        case liked_by_user = "liked_by_user"
        case current_user_collections = "current_user_collections"
        case sponsorship = "sponsorship"
        case topic_submissions = "topic_submissions"
        case asset_type = "asset_type"
        case user = "user"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        alternative_slugs = try values.decodeIfPresent(Alternative_slugs.self, forKey: .alternative_slugs)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        promoted_at = try values.decodeIfPresent(String.self, forKey: .promoted_at)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        blur_hash = try values.decodeIfPresent(String.self, forKey: .blur_hash)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        alt_description = try values.decodeIfPresent(String.self, forKey: .alt_description)
        breadcrumbs = try values.decodeIfPresent([Breadcrumbs].self, forKey: .breadcrumbs)
        urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
        likes = try values.decodeIfPresent(Int.self, forKey: .likes)
        liked_by_user = try values.decodeIfPresent(Bool.self, forKey: .liked_by_user)
        current_user_collections = try values.decodeIfPresent([String].self, forKey: .current_user_collections)
        sponsorship = try values.decodeIfPresent(String.self, forKey: .sponsorship)
        topic_submissions = try values.decodeIfPresent(Topic_submissions.self, forKey: .topic_submissions)
        asset_type = try values.decodeIfPresent(String.self, forKey: .asset_type)
        user = try values.decodeIfPresent(User.self, forKey: .user)
    }

}

struct Alternative_slugs : Codable {
    let en : String?
    let es : String?
    let ja : String?
    let fr : String?
    let it : String?
    let ko : String?
    let de : String?
    let pt : String?

    enum CodingKeys: String, CodingKey {

        case en = "en"
        case es = "es"
        case ja = "ja"
        case fr = "fr"
        case it = "it"
        case ko = "ko"
        case de = "de"
        case pt = "pt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        en = try values.decodeIfPresent(String.self, forKey: .en)
        es = try values.decodeIfPresent(String.self, forKey: .es)
        ja = try values.decodeIfPresent(String.self, forKey: .ja)
        fr = try values.decodeIfPresent(String.self, forKey: .fr)
        it = try values.decodeIfPresent(String.self, forKey: .it)
        ko = try values.decodeIfPresent(String.self, forKey: .ko)
        de = try values.decodeIfPresent(String.self, forKey: .de)
        pt = try values.decodeIfPresent(String.self, forKey: .pt)
    }

}


struct Film : Codable {
    let status : String?
    let approved_on : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case approved_on = "approved_on"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        approved_on = try values.decodeIfPresent(String.self, forKey: .approved_on)
    }

}

struct Links : Codable {
    let selfString : String?
    let html : String?
    let photos : String?
    let likes : String?
    let portfolio : String?
    let following : String?
    let followers : String?

    enum CodingKeys: String, CodingKey {

        case selfString = "self"
        case html = "html"
        case photos = "photos"
        case likes = "likes"
        case portfolio = "portfolio"
        case following = "following"
        case followers = "followers"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        selfString = try values.decodeIfPresent(String.self, forKey: .selfString)
        html = try values.decodeIfPresent(String.self, forKey: .html)
        photos = try values.decodeIfPresent(String.self, forKey: .photos)
        likes = try values.decodeIfPresent(String.self, forKey: .likes)
        portfolio = try values.decodeIfPresent(String.self, forKey: .portfolio)
        following = try values.decodeIfPresent(String.self, forKey: .following)
        followers = try values.decodeIfPresent(String.self, forKey: .followers)
    }

}

struct Profile_image : Codable {
    let small : String?
    let medium : String?
    let large : String?

    enum CodingKeys: String, CodingKey {

        case small = "small"
        case medium = "medium"
        case large = "large"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        small = try values.decodeIfPresent(String.self, forKey: .small)
        medium = try values.decodeIfPresent(String.self, forKey: .medium)
        large = try values.decodeIfPresent(String.self, forKey: .large)
    }

}

struct Social : Codable {
    let instagram_username : String?
    let portfolio_url : String?
    let twitter_username : String?
    let paypal_email : String?

    enum CodingKeys: String, CodingKey {

        case instagram_username = "instagram_username"
        case portfolio_url = "portfolio_url"
        case twitter_username = "twitter_username"
        case paypal_email = "paypal_email"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        instagram_username = try values.decodeIfPresent(String.self, forKey: .instagram_username)
        portfolio_url = try values.decodeIfPresent(String.self, forKey: .portfolio_url)
        twitter_username = try values.decodeIfPresent(String.self, forKey: .twitter_username)
        paypal_email = try values.decodeIfPresent(String.self, forKey: .paypal_email)
    }

}

struct Topic_submissions : Codable {
    let travel : Travel?
    let film : Film?

    enum CodingKeys: String, CodingKey {

        case travel = "travel"
        case film = "film"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        travel = try values.decodeIfPresent(Travel.self, forKey: .travel)
        film = try values.decodeIfPresent(Film.self, forKey: .film)
    }

}

struct Travel : Codable {
    let status : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}

struct Urls : Codable {
    let raw : String?
    let full : String?
    let regular : String?
    let small : String?
    let thumb : String?
    let small_s3 : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
        case small_s3 = "small_s3"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(String.self, forKey: .raw)
        full = try values.decodeIfPresent(String.self, forKey: .full)
        regular = try values.decodeIfPresent(String.self, forKey: .regular)
        small = try values.decodeIfPresent(String.self, forKey: .small)
        thumb = try values.decodeIfPresent(String.self, forKey: .thumb)
        small_s3 = try values.decodeIfPresent(String.self, forKey: .small_s3)
    }

}

struct User : Codable {
    let id : String?
    let updated_at : String?
    let username : String?
    let name : String?
    let first_name : String?
    let last_name : String?
    let twitter_username : String?
    let portfolio_url : String?
    let bio : String?
    let location : String?
    let links : Links?
    let profile_image : Profile_image?
    let instagram_username : String?
    let total_collections : Int?
    let total_likes : Int?
    let total_photos : Int?
    let total_promoted_photos : Int?
    let total_illustrations : Int?
    let total_promoted_illustrations : Int?
    let accepted_tos : Bool?
    let for_hire : Bool?
    let social : Social?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case updated_at = "updated_at"
        case username = "username"
        case name = "name"
        case first_name = "first_name"
        case last_name = "last_name"
        case twitter_username = "twitter_username"
        case portfolio_url = "portfolio_url"
        case bio = "bio"
        case location = "location"
        case links = "links"
        case profile_image = "profile_image"
        case instagram_username = "instagram_username"
        case total_collections = "total_collections"
        case total_likes = "total_likes"
        case total_photos = "total_photos"
        case total_promoted_photos = "total_promoted_photos"
        case total_illustrations = "total_illustrations"
        case total_promoted_illustrations = "total_promoted_illustrations"
        case accepted_tos = "accepted_tos"
        case for_hire = "for_hire"
        case social = "social"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        twitter_username = try values.decodeIfPresent(String.self, forKey: .twitter_username)
        portfolio_url = try values.decodeIfPresent(String.self, forKey: .portfolio_url)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
        profile_image = try values.decodeIfPresent(Profile_image.self, forKey: .profile_image)
        instagram_username = try values.decodeIfPresent(String.self, forKey: .instagram_username)
        total_collections = try values.decodeIfPresent(Int.self, forKey: .total_collections)
        total_likes = try values.decodeIfPresent(Int.self, forKey: .total_likes)
        total_photos = try values.decodeIfPresent(Int.self, forKey: .total_photos)
        total_promoted_photos = try values.decodeIfPresent(Int.self, forKey: .total_promoted_photos)
        total_illustrations = try values.decodeIfPresent(Int.self, forKey: .total_illustrations)
        total_promoted_illustrations = try values.decodeIfPresent(Int.self, forKey: .total_promoted_illustrations)
        accepted_tos = try values.decodeIfPresent(Bool.self, forKey: .accepted_tos)
        for_hire = try values.decodeIfPresent(Bool.self, forKey: .for_hire)
        social = try values.decodeIfPresent(Social.self, forKey: .social)
    }

}

struct Breadcrumbs : Codable {
    let slug : String?
    let title : String?
    let index : Int?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case slug = "slug"
        case title = "title"
        case index = "index"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        index = try values.decodeIfPresent(Int.self, forKey: .index)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
