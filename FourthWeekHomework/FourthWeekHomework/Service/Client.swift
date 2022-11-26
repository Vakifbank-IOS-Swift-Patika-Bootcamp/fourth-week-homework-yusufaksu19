//
//  Client.swift
//  FourthWeekHomework
//
//  Created by Yusuf Aksu on 26.11.2022.
//

import Foundation

final class Client {

    enum Endpoints {
        static let base = "https://www.breakingbadapi.com/api"

        case characters
        case characterDetails(Int)
        case characterQuotes(String)
        case episodes
        case episodeDetail(Int)

        var stringValue: String {
            switch self {
            case .characters:
                return Endpoints.base + "/characters"
            case .characterDetails(let characterID):
                return Endpoints.base + "/characters/\(characterID)"
            case .characterQuotes(let characterFullName):
                return Endpoints.base + "/quote?author=\(characterFullName)"
            case .episodes:
                return Endpoints.base + "/episodes"
            case .episodeDetail(let episodeID):
                return Endpoints.base + "/episodes/\(episodeID)"
            }
        }

        var url: URL {
            return URL(string: stringValue)!
        }
    }

    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()

        return task
    }

    class func getCharacters(completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.characters.url, responseType: GetCharactersResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }

  class func getCharacterDetails(characterID: Int, completion: @escaping ([CharacterDetailsModel]?, Error?) -> Void) {
      taskForGETRequest(url: Endpoints.characterDetails(characterID).url, responseType: GetCharacterDetailsResponseModel.self) { response, error in
          if let response = response {
              completion(response.result, nil)
          } else {
              completion(nil, error)
          }
      }
  }

  class func getCharacterQuotes(characterFullName: String, completion: @escaping ([CharacterQuotesModel]?, Error?) -> Void) {
      taskForGETRequest(url: Endpoints.characterQuotes(characterFullName).url, responseType: GetCharacterQuotesResponseModel.self) { response, error in
          if let response = response {
              completion(response.result, nil)
          } else {
              completion(nil, error)
          }
      }
  }

    class func getEpisodes(completion: @escaping ([EpisodeModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodes.url, responseType: GetEpisodesResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }

    class func getEpisodeDetails(episodeID: Int, completion: @escaping ([EpisodeDetailModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodeDetail(episodeID).url, responseType: GetEpisodeDetailResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
