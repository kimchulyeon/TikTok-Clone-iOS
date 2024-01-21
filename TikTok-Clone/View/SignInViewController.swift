//
//  SignInViewController.swift
//  TikTok-Clone
//
//  Created by chulyeon kim on 1/20/24.
//

import UIKit

class SignInViewController: UIViewController {
    // MARK: - properties
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
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
        navigationItem.title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupUI() {
        setupEmailTextField()
        setupPasswordTextField()
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
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
    }
}
