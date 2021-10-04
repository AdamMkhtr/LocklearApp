//
//  InstagramProvider.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 03/10/2021.
//

import Foundation
import Alamofire

class InstagramProvider {

  enum InstagramProviderError: LocalizedError {
    case errorResponse

    var errorDescription: String? {
      switch self {
      case .errorResponse: return "error response"
      }
    }
  }

  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  private var url = "https://graph.instagram.com/me?"

  private let apiKey: String

  init(apiKey: String = APIKeys.instagramAPIKey) {
    self.apiKey = apiKey
  }


  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  /// Call the API edaman for collect data
  /// - Parameters:
  ///   - querry: ingredients for API call
  ///   - completion: completion return an array with recipes
  func fetchRecipes(
    completion: @escaping ((Result<InstagramIDPictures, Error>) -> Void)
  ) {
    var queryParameters: [String: Any] = [
      "fields": "media",
      "access_token": apiKey,
    ]
    let request = AF.request(url, parameters: queryParameters)

    request.responseJSON { (response) in
      guard let data = response.data else {
        completion(.failure(InstagramProviderError.errorResponse))
        return
      }

      do {
        let instagramJSON = try JSONDecoder().decode(InstagramIDPictures.self, from: data)
        completion(.success(instagramJSON))
      } catch {
        print(error.localizedDescription)
        completion(.failure(error))
      }
    }
  }
}
