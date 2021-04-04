//
//  AuthManager.swift
//  instagram
//
//  Created by Irvan Mahardhika on 03/04/21.
//

// added
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared._isNewUserCreatable(email: email, username: username) { (_isCreatable) in
            if _isCreatable {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard result != nil, error == nil else {
                        completion(false)
                        return
                    }
                    
                    DatabaseManager.shared.insertNewUser(email: email, username: username) { (success) in
                        if success {
                            completion(true)
                            return
                        }
                        else {
                            completion(false)
                            return
                        }
                    }
                    
                    
                }
            }
            else {
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            print(username)
        }
    }
    
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
    
    
}
//
