//
//  StorageManager.swift
//  instagram
//
//  Created by Irvan Mahardhika on 03/04/21.
//

// added
import FirebaseStorage

public class StorageManager {
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStoryManagerError:Error {
        case failedToDownload
    }
    
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result < URL, Error >) -> Void) {
        
    }
    
    public func downloadImage(ref: String, completion: @escaping (Result < URL, IGStoryManagerError >) -> Void) {
        bucket.child(ref).downloadURL { (url, error) in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }
    
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let postType : UserPostType
}
//
