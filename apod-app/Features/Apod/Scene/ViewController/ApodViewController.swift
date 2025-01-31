//
//  ApodViewController.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

class ApodViewController: UIViewController {
    private let contentView: ApodView
    
    init(contentView: ApodView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apod"
//        navigationController?.navigationBar.prefersLargeTitles = true
      //  navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appName]
        let favoriteButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = favoriteButton
    }
}
