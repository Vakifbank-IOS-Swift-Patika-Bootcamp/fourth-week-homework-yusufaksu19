//
//  CharacterQuotesModel.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import Foundation

struct CharacterQuotesModel: Codable {
    let characterQuoteID: Int
    let characterQuote: String


    enum CodingKeys: String, CodingKey {
        case characterQuoteID = "quote_id"
        case characterQuote = "quote"
    }
}
