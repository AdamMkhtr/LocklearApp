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
let instagramIDConverter = InstagramIDPicturesConverter()
var idPictures = [String]()
var delegate: InstagramDelegate?
private(set) var detailsPictures = [DetailsPictures]()

//----------------------------------------------------------------------------
// MARK: - Methods
//----------------------------------------------------------------------------

//17843154172023190 id instagram pict

/// Send the data on the API call to delegate
/// - Parameter idPicture: recup the id picture for API
func convert(idPicture : String, completion: @escaping ((Result<DetailsPictures, Error>) -> Void)) {
instagramProvider.fetchDetailsPictures(idPicture : idPicture) { [weak self] result in
switch result {
case .success(let searchResult):
guard let pictures = self?.convertFetchInstagramSuccess(searchResult: searchResult) else {
completion(.failure(InstagramDetailsConverterError.noResponse))
return
}
print(pictures)
self?.detailsPictures.append(pictures)
completion(.success(pictures))

case .failure(let error):
completion(.failure(error))
}
}
}

func collectIDPictures() {
instagramIDConverter.convertIDPictures() { [weak self] result in
switch result {
case .success(let result):
self?.didCollectIDPictures(idPictures: result)
case .failure(let error):
print(error)
}
}
}

func collectDetailsPictures() {
collectIDPictures()
for idPicture in idPictures {
  convert(idPicture: idPicture) { [weak self] result in
    switch result {
    case .success(let result):
      self?.detailsPictures.append(result)
    case .failure(let error):
    print(error)
  }
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

extension InstagramDetailsConverter: InstagramDelegate {
func didCollectIDPictures(idPictures: [String]) {
self.idPictures = idPictures
}
}
