//
//  ImageService.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import Foundation
import UIKit

final class ImageService {
    
    static let shared = ImageService()
    
    func getImageFromURL(url: String?) -> UIImage? {
        
        if (url == nil) {
            return UIImage(systemName: "")
        }
        
        if let data = try? Data(contentsOf: URL(string: url!)!) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
        
    }
    
}
