//
//  CharacterDetailsModel.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import Foundation

struct CharacterDetailsModel: Codable {
    let characterDetailsId: Int
    let characterDetailsName: String
    let characterDetailsBirthday: String
    let characterDetailsNickname: String
    let characterDetailsStatus: String
    let characterDetailsImage: String


  enum CodingKeys: String, CodingKey {
    case characterDetailsId = "char_id"
    case characterDetailsName = "name"
    case characterDetailsBirthday = "birthday"
    case characterDetailsNickname = "nickname"
    case characterDetailsStatus = "status"
    case characterDetailsImage = "img"
  }
}
