//
//  OnboardingViewController.swift
//  Bank App
//
//  Created by Saruululzii on 11/30/23.
//

import Foundation

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let obImageView = UIImageView()
    let obLabelView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        obImageView.translatesAutoresizingMaskIntoConstraints = false
        obImageView.contentMode = .scaleAspectFit
        obImageView.image = UIImage(named: "delorean")
        
        obLabelView.translatesAutoresizingMaskIntoConstraints = false
        obLabelView.font = UIFont.preferredFont(forTextStyle: .title3)
        obLabelView.textAlignment = .center
        obLabelView.numberOfLines = 0
        obLabelView.adjustsFontForContentSizeCategory = true
        obLabelView.text = "Super long text will be here! Now I am writing something cause of don't want to see empty space here!!!"
    }
    
    func layout() {
        stackView.addArrangedSubview(obImageView)
        stackView.addArrangedSubview(obLabelView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
