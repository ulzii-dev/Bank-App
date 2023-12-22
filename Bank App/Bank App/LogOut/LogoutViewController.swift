//
//  LogoutViewController.swift
//  Bank App
//
//  Created by Saruululzii on 12/21/23.
//

import UIKit

class LogoutViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let signOutButton = UIButton()
    
    weak var logoutDelegate: LogoutViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension LogoutViewController {
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.text = "LABEL"
        
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.configuration = .filled()
        signOutButton.configuration?.imagePadding = 8
        signOutButton.setTitle("Sign out", for: [])
        signOutButton.addTarget(self, action: #selector(signOutClicked), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(signOutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func signOutClicked() {
        logoutDelegate?.loggedOut()
    }
}
