//
//  LoginViewController.swift
//  TikTok-Clone
//
//  Created by chulyeon kim on 1/20/24.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - properties
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
    }

    // MARK: - method
    private func setupUI() {
        facebookButton.layer.cornerRadius = 18
        signUpButton.layer.cornerRadius = 18
        googleButton.layer.cornerRadius = 18
        loginButton.layer.cornerRadius = 18
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
}

