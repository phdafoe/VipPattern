//
//  MoviesServerModel.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

// MARK: - ContactosModel
struct MoviesServerModel: Codable {
    let feed: Feed?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultModel]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Author
struct Author: Codable {
    let name: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate = "alternate"
    }
}

// MARK: - Result
struct ResultModel: Codable, Identifiable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let kind: String?
    let copyright: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case kind = "kind"
        case copyright = "copyright"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreId: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreId = "genreId"
        case name = "name"
        case url = "url"
    }
}

extension MoviesServerModel {
    static var stubbedMovies: [ResultModel] {
        let response: MoviesServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "movies")
        return response?.feed?.results ?? []
    }
    
    static var stubeedResultMovie: ResultModel {
        stubbedMovies[0]
    }
}


