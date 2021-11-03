//
//  YoutubeConverter.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 30/10/2021.
//

import Foundation

class YoutubeConverter {
  
  //----------------------------------------------------------------------------
  // MARK: - Error Management
  //----------------------------------------------------------------------------

  enum YoutubeConverterError: Error {
    case noResponse
  }

  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  let youtubeProvider = YoutubeProvider()
  private(set) var videoDetails = [Item]()

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  /// Send the data on the API call to delegate
  /// - Parameter query: recup the list og ingredients for API call
  func convert(completion: @escaping ((Result<[Item], Error>) -> Void)) {
    youtubeProvider.fetchYoutubeVideos() { [weak self] result in
      switch result {
      case .success(let searchResult):
        guard let videos = self?.convertFetchYoutubeSuccess(searchResult: searchResult) else {
          completion(.failure(YoutubeConverterError.noResponse))
          return
        }
        self?.videoDetails = videos
        completion(.success(videos))

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  /// this function is call when "convert" is success, use the delegate for send error at user,
  /// or for send the array of id pictures
  /// - Parameter searchResult: collect the array of this class for work with
  private func convertFetchYoutubeSuccess(searchResult: YoutubeCodable) -> [Item]? {
    let videos = searchResult.items
    print("\(videos.count)" + " ICI")
    guard videos.count > 0 else { return nil }
    return videos
  }


}
