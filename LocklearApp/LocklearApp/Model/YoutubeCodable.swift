//
//  YoutubeCodable.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 30/10/2021.
//

import Foundation

// MARK: - YoutubeCodable
struct YoutubeCodable: Codable {
    let kind, etag, nextPageToken, regionCode: String
    let pageInfo: PageInfo
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind: ItemKind
    let etag: String
    let id: ID
    let snippet: Snippet
}

// MARK: - ID
struct ID: Codable {
    let kind: IDKind
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

enum IDKind: String, Codable {
    case youtubeVideo = "youtube#video"
}

enum ItemKind: String, Codable {
    case youtubeSearchResult = "youtube#searchResult"
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: Date
    let channelID: ChannelID
    let title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: ChannelTitle
    let liveBroadcastContent: LiveBroadcastContent
    let publishTime: Date

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}

enum ChannelID: String, Codable {
    case uCvuACILbubOXVOMBWqLM2G = "UCvuACILbubOXV_OMBWqLM2g"
}

enum ChannelTitle: String, Codable {
    case locklear = "LOCKLEAR"
}

enum LiveBroadcastContent: String, Codable {
    case none = "none"
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
