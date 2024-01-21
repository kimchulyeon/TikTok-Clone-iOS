//
//  SignUpViewController.swift
//  TikTok-Clone
//
//  Created by chulyeon kim on 1/20/24.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import PhotosUI

class SignUpViewController: UIViewController {
    // MARK: - properties
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    // MARK: - method
    private func setupNavigationBar() {
        navigationItem.title = "Create new account"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupUI() {
        setupAvatar()
        setupUsernameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignupButton()
    }
    
    private func setupAvatar() {
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.clipsToBounds = true
        avatarImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(avatarImageViewTapped))
        avatarImageView.addGestureRecognizer(tap)
    }
    private func setupUsernameTextField() {
        usernameContainerView.layer.borderWidth = 1
        usernameContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.8)
        usernameContainerView.layer.cornerRadius = 20
        usernameContainerView.clipsToBounds = true
        usernameTextField.borderStyle = .none
    }
    private func setupEmailTextField() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.8)
        emailContainerView.layer.cornerRadius = 20
        emailContainerView.clipsToBounds = true
        emailTextField.borderStyle = .none
    }
    private func setupPasswordTextField() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.8)
        passwordContainerView.layer.cornerRadius = 20
        passwordContainerView.clipsToBounds = true
        passwordTextField.borderStyle = .none
    }
    private func setupSignupButton() {
        signUpButton.layer.cornerRadius = 18
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            if let result = result {
                let data: Dictionary<String, Any> = [
                    "uid": result.user.uid,
                    "email": result.user.email ?? "",
                    "profileImageUrl": "",
                    "status": ""
                ]
                
                Database.database(url: "https://tiktok-clone-ios-default-rtdb.asia-southeast1.firebasedatabase.app").reference().child("users").child(result.user.uid).updateChildValues(data) { error, databaseRef in
                    if let error = error {
                        return print(error.localizedDescription)
                    }
                    
                    print("DONE")
                }
            }
        }
    }
}

extension SignUpViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let error = error {
                    return print(error.localizedDescription)
                }
                
                if let image = image as? UIImage {
                    DispatchQueue.main.async { [weak self] in
                        self?.avatarImageView.image = image
                    }
                }
            }
        }
        dismiss(animated: true)
    }
    
    @objc func avatarImageViewTapped() {
        var configuration: PHPickerConfiguration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 1
        
        let picker: PHPickerViewController = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
}
