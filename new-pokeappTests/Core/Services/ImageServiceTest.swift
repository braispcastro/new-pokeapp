//
//  ImageServiceTest.swift
//  new-pokeappTests
//
//  Created by Castro, Brais on 23/11/21.
//

import XCTest
import Nimble
@testable import new_pokeapp

class ImageServiceTest: XCTestCase {
    
    func test_image_when_url_is_nil() {
        let img = ImageService.shared.getImageFromURL(url: nil)
        
        expect(img).toEventually(beNil())
    }
    
    func test_image_when_url_is_empty_string() {
        let img = ImageService.shared.getImageFromURL(url: "")
        
        expect(img).toEventually(beNil())
    }
    
    func test_image_when_url_is_not_an_actual_url() {
        let img = ImageService.shared.getImageFromURL(url: "123456")
        
        expect(img).toEventually(beNil())
    }
    
    func test_image_when_url_is_an_actual_image() {
        let img = ImageService.shared.getImageFromURL(url: "https://via.placeholder.com/140x100")
        
        expect(img).toEventually(beAKindOf(UIImage.self))
    }
    
}
