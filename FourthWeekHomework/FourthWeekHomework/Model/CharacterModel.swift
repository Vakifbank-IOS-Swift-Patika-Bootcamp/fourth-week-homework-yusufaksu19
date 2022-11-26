//
//  CharacterModel.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import Foundation

struct CharacterModel: Codable {
    let charId: Int
    let characterName: String
    let characterBirthday: String
    let characterNickname: String

    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case characterName = "name"
        case characterBirthday = "birthday"
        case characterNickname = "nickname"
    }
}
