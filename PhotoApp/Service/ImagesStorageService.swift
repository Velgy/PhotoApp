//
//  ImagesStorageService.swift
//  PhotoApp
//
//  Created by Валентин Панин on 13.12.2020.
//

import UIKit

// нужно будет сохранять в файлы, можно использовать NSFileManager

class ImagesStorageService {
    // singletone
    static let shared = ImagesStorageService()
    
    func loadImage(key: String) -> UIImage? {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
    
    func saveImage(key: String, value: UIImage) {
        UserDefaults.standard.setValue(value.jpegData(compressionQuality: 1), forKey: key)
        UserDefaults.standard.synchronize()
    }
}
