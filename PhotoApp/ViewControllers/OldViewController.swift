//
//  ViewController.swift
//  PhotoApp
//
//  Created by Валентин Панин on 28.11.2020.
//

import UIKit

//class A {
//    var b: String!
//    var c: String!
//}
//
//var mySuperVariable: A
//mySuperVariable = A()
//mySuperVariable.b = "some string"
//NSLog(mySuperVariable.c)


class OldViewController: UIViewController {

//    var but: UIButton = {
//        let button = UIButton(type: .system)
//        button.tag = 1
//        button.setTitle("Select Photo", for: .normal)
//        button.setTitle("Pressed button", for: .highlighted)
//        button.sizeToFit()
//        button.frame.origin = CGPoint(x: 150, y: 50)
//        //button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
//        //view.addSubview(self.button)
//
//        return button
//    }()
    
    
    var button: UIButton!
    var button2: UIButton!
    var imageView: UIImageView!
    var imageView2: UIImageView!
    var targetImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Select Photo"
        
        self.view.backgroundColor = .white
        
//        let test: String = ""
        
//        but.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
//        view.addSubview(self.but)
//
        self.createImageView()
        self.createImageView2()
        self.createButton()
        self.createButton2()
    }
    
    private func createButton() {
        self.button = UIButton(type: .system)
        self.button.tag = 1
        self.button.setTitle("Select Photo", for: .normal)
        self.button.setTitle("Pressed button", for: .highlighted)
        self.button.sizeToFit()
        self.button.frame.origin = CGPoint(x: 150, y: 100)
        self.button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        self.view.addSubview(self.button)
    }
    
    private func createButton2() {
        self.button2 = UIButton(type: .system)
        self.button2.tag = 2
        self.button2.setTitle("Select Photo", for: .normal)
        self.button2.sizeToFit()
        self.button2.frame.origin = CGPoint(x: 150, y: 400)
        self.button2.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        self.view.addSubview(self.button2)
    }
    
    private func createImageView() {
        self.imageView = UIImageView()
        self.imageView.backgroundColor = .red
        self.imageView.frame = CGRect(x: 90, y: 130, width: 200, height: 200)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.clipsToBounds = true
        self.view.addSubview(self.imageView)
    }
    
    private func createImageView2() {
        self.imageView2 = UIImageView()
        self.imageView2.backgroundColor = .red
        self.imageView2.frame = CGRect(x: 90, y: 430, width: 200, height: 200)
        self.imageView2.contentMode = .scaleAspectFit
        self.imageView2.clipsToBounds = true
        self.view.addSubview(self.imageView2)
    }

    @objc
    func buttonPressed(sender: UIButton) {
        let controller = UIImagePickerController()
        
        //let viewController = ViewController()// init()
        //present(viewController, animated: true) // viewDidLoad
        // viewWillAppear
        // viewDidAppear
        
        controller.delegate = self
        
        switch sender.tag {
        case 1:
            targetImageView = imageView
        case 2:
            targetImageView = imageView2
        default:
            break
        }
        
        if sender == button {
            targetImageView = imageView
        } else if sender == button2 {
            targetImageView = imageView2
        }
        
        self.present(controller, animated: true, completion: nil)
    }       
    
}

extension OldViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        NSLog("didCancel")
        
        picker.dismiss(animated: true, completion: nil) // viewWillDissapear
        // viewDidDissapear
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NSLog("didFinishPicking")
                
        if let image = info[.originalImage] as? UIImage {
            NSLog("image avaliable")
            self.targetImageView.image = image
        } else {
            NSLog("image unavaliable")
        }

        picker.dismiss(animated: true, completion: nil)
    }
    
}


