//
//  EpisodeDetailModel.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import Foundation

struct EpisodeDetailModel: Codable {
    let characters: [String]


    enum CodingKeys: String, CodingKey {
        case characters = "characters"

    }
}
