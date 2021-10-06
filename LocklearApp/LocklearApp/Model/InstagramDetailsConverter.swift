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
  private(set) var detailsPictures = [DetailsPictures]()

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

}
