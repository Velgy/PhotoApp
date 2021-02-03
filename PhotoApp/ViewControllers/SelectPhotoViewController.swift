//
//  SelectPhotoViewController.swift
//  PhotoApp
//
//  Created by Валентин Панин on 06.12.2020.
//

import UIKit

class SelectPhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var button: UIButton!
    var imageView: UIImageView!
    var targetImageView: UIImageView!
    
    enum ViewControllerType: String, CaseIterable {
        case square
        case rectangle
        case circle
        
        var imageStorageKey: String {
            return "image_\(self.rawValue)"
        }
        
    }
    
    let type: ViewControllerType
    init(type: ViewControllerType) {
        self.type = type
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // здесь создаешь настраиваешь ui view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch self.type {
        case .square:
            self.view.backgroundColor = .white
            self.navigationItem.title = "Square"
            self.createImageView()

        case .rectangle:
            self.view.backgroundColor = .white
            self.navigationItem.title = "Rectangle"
            self.createImageView2()
            
        case .circle:
            self.view.backgroundColor = .white
            self.navigationItem.title = "Circle"
            self.createImageCircle()
        }
        
        self.createButton()
        
        if let image = ImagesStorageService.shared.loadImage(key: self.type.imageStorageKey) {
            self.imageView.image = image
        }
    }
    
    private func createButton() {
        self.button = UIButton(type: .system)
        self.button.setTitle("Select Photo", for: .normal)
        self.button.sizeToFit()
        self.button.frame.origin = CGPoint(x: 150, y: 200)
        self.button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    private func createImageView() {
        self.imageView = UIImageView(frame: CGRect(x: 75, y: 225, width: 250, height: 250))
        self.imageView.backgroundColor = .black
        self.imageView.contentMode = .scaleToFill
        self.view.addSubview(self.imageView)
    }
    
    private func createImageView2() {
        self.imageView = UIImageView(frame: CGRect(x: 75, y: 225, width: 250, height: 200))
        self.imageView.backgroundColor = .black
        self.view.addSubview(self.imageView)
    }
    
    private func createImageCircle() {
        self.imageView = UIImageView(frame: CGRect(x: 75, y: 225, width: 250, height: 250))
        self.imageView.backgroundColor = .black
        self.view.addSubview(self.imageView)
        self.imageView.applyRounded()
    }
    
        
    @objc
    func buttonPressed() {
        let controller = UIImagePickerController()
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
   
}

extension SelectPhotoViewController {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        NSLog("Cancel")
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NSLog("Did finish")
        
        if let image = info[.originalImage] as? UIImage {
            NSLog("image")
            self.imageView.image = image
            ImagesStorageService.shared.saveImage(key: self.type.imageStorageKey, value: image)
        } else {
            NSLog("image nil")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}


extension UIImageView {
    
    func applyRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
