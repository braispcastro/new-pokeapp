//
//  BaseViewController.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func getImageFromURL(url: String?) -> UIImage? {
        
        if let data = try? Data(contentsOf: URL(string: url!)!) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
        
    }

}
