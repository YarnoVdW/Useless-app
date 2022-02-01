//
//  ViewController.swift
//  RandomPhoto
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
    let collorAray = [ UIColor.red, UIColor.blue, UIColor.green, UIColor.magenta]
    
    let button = UIButton()
    
    func configureButton() {
        button.configuration = .tinted()
        button.configuration?.title = "pres me"
        button.configuration?.image = UIImage(systemName: "questionmark")
        button.configuration?.baseBackgroundColor = .systemBlue
        button.configuration?.imagePadding = 6
        button.configuration?.baseForegroundColor = .systemBlue
    }
        
    

    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = collorAray.randomElement()
           
            view.addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: 900, height: 1800)
            imageView.center = view.center
        
            view.addSubview(button)
            //button.frame = CGRect(x: 10, y: view.frame.size.width-100-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 30)
            getRandomPhoto()
            configureButton()
            button.addTarget(self, action: #selector(drukken), for: .allTouchEvents)
        }
    
    
    @objc func drukken() {
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 10, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: view.frame.size.width-20, height: 50)
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




