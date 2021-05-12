//
//  imageUploader.swift
//  InstagramCopy
//
//  Created by Vachko on 15.04.21.
//

import UIKit
import Firebase

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/Profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/Post_images/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let ref = type.filePath
        
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
