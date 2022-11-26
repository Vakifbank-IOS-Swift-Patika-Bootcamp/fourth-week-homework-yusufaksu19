//
//  EpisodeModel.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import Foundation

struct EpisodeModel: Codable {
    let episodeID: Int
    let episodeTitle: String
    let episodeSeason: String


    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case episodeTitle = "title"
        case episodeSeason = "season"
    }
}
