//
//  imageUploader.swift
//  InstagramCopy
//
//  Created by Vachko on 15.04.21.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/Profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) {_, error in
            if let error = error {
                print("Error uploading image with error \(error.localizedDescription)")
                return
            }
            print("Successfully uploaded image!")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
