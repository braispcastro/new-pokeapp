//
//  InformationViewController.swift
//  new-pokeapp
//
//  Created by Castro, Brais on 18/11/21.
//

import UIKit

class InformationViewController: BaseViewController {
    
    @IBOutlet weak var spriteFront: UIImageView!
    @IBOutlet weak var spriteBack: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseExperienceLabel: UILabel!
    
    var presenter: InformationPresenterProtocol!
    private var viewModel: Information.ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareView()
    }

}

extension InformationViewController: InformationViewControllerProtocol {
    
    func show(viewModel: Information.ViewModel) {
        self.viewModel = viewModel
        self.title = viewModel.title
        
        spriteFront.image = ImageService.shared.getImageFromURL(url: viewModel.frontImage)
        spriteBack.image = ImageService.shared.getImageFromURL(url: viewModel.backImage)
        numberLabel.text = viewModel.number
        nameLabel.text = viewModel.name
        heightLabel.text = viewModel.height
        weightLabel.text = viewModel.weight
        baseExperienceLabel.text = viewModel.baseExperience
    }
    
}
