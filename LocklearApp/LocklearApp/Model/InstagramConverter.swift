//
//  InstagramConverter.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 03/10/2021.
//

import Foundation

class InstagramConverter {

//----------------------------------------------------------------------------
// MARK: - Error Management
//----------------------------------------------------------------------------

enum InstagramConverterError: Error {
  case noResponse
}

//----------------------------------------------------------------------------
// MARK: - Properties
//----------------------------------------------------------------------------

let instagramProvider = InstagramProvider()
private(set) var picturesID = [String]()

//----------------------------------------------------------------------------
// MARK: - Methods
//----------------------------------------------------------------------------

/// Send the data on the API call to delegate
/// - Parameter query: recup the list og ingredients for API call
func convert(completion: @escaping ((Result<[String], Error>) -> Void)) {
instagramProvider.fetchRecipes() { [weak self] result in
  switch result {
  case .success(let searchResult):
    guard let pictures = self?.convertFetchInstagramSuccess(searchResult: searchResult) else {
      completion(.failure(InstagramConverterError.noResponse))
      return
    }
    self?.picturesID = pictures
    completion(.success(pictures))

  case .failure(let error):
    completion(.failure(error))
  }
}
}

/// this function is call when "convert" is success, use the delegate for send error at user,
/// or for send the array of id pictures
/// - Parameter searchResult: collect the array of this class for work with
private func convertFetchInstagramSuccess(searchResult: InstagramIDPictures) -> [String]? {
  let pictures = searchResult.media.data.map { $0.id }
guard pictures.count > 0 else { return nil }
  print(pictures)
return pictures
}

}
