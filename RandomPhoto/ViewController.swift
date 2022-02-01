//
//  ViewController.swift
//  UselessApp
//
//  Created by Yarno Van de Weyer on 31/01/2022.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    
    
    let button = UIButton()
    
    func configureButton() {
        button.configuration = .filled()
        button.configuration?.title = "press me"
        button.configuration?.image = UIImage(systemName: "camera")
        button.configuration?.baseBackgroundColor = .systemBlue
        button.configuration?.imagePadding = 8
        button.configuration?.baseForegroundColor = .black
        button.configuration?.imagePlacement = .leading
        button.configuration?.cornerStyle = .capsule
        
        buttonConstraint()
        
    }
    func buttonConstraint() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    
                                     button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250),
                                     button.widthAnchor.constraint(equalToConstant: 150),
                                     button.heightAnchor.constraint(equalToConstant: 70)])
    }
        
    

    override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: 900, height: 1800)
            imageView.center = view.center
        
            view.addSubview(button)
            configureButton()
            button.addTarget(self, action: #selector(presButton), for: .allTouchEvents)
            getRandomPhoto()
        
        
        
        }
    
    
    @objc func presButton() {
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
        func getRandomPhoto() {
            let urlString = "https://source.unsplash.com/random/600x600"
            
            let url = URL(string: urlString)!
            guard let data = try? Data(contentsOf: url) else {
                return
            
            }
            imageView.image = UIImage(data: data)
        }
        

    }




