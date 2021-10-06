//
//  InstagramDetailsConverter.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 04/10/2021.
//

import Foundation

class InstagramDetailsConverter {

//----------------------------------------------------------------------------
// MARK: - Error Management
//----------------------------------------------------------------------------

enum InstagramDetailsConverterError: Error {
  case noResponse
}

//----------------------------------------------------------------------------
// MARK: - Properties
//----------------------------------------------------------------------------

let instagramProvider = InstagramDetailsProvider()
var instagramIDPictures = [String]()
  private(set) var detailsPictures: DetailsPictures?

//----------------------------------------------------------------------------
// MARK: - Methods
//----------------------------------------------------------------------------

/// Send the data on the API call to delegate
/// - Parameter query: recup the list og ingredients for API call
func convert(completion: @escaping ((Result<DetailsPictures, Error>) -> Void)) {
  instagramProvider.fetchDetailsPictures(idPicture : "17843154172023190") { [weak self] result in
  switch result {
  case .success(let searchResult):
    guard let pictures = self?.convertFetchInstagramSuccess(searchResult: searchResult) else {
      completion(.failure(InstagramDetailsConverterError.noResponse))
      return
    }
    print(pictures)
    self?.detailsPictures = pictures
    completion(.success(pictures))

  case .failure(let error):
    completion(.failure(error))
  }
}
}

/// this function is call when "convert" is success, use the delegate for send error at user,
/// or for send the array of id pictures
/// - Parameter searchResult: collect the array of this class for work with
private func convertFetchInstagramSuccess(searchResult: DetailsPictures) -> DetailsPictures? {
  let detailsPicture = searchResult
guard detailsPicture != nil else { return nil }
  print(detailsPicture.mediaURL)
return detailsPicture
}

}
