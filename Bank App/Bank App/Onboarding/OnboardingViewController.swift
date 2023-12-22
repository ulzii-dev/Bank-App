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
    
    var onboardingImageName: String
    var onboardingText: String
    
    init(onboardingImageName: String = "", onboardingText: String = "") {
        self.onboardingImageName = onboardingImageName
        self.onboardingText = onboardingText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        obImageView.translatesAutoresizingMaskIntoConstraints = false
        obImageView.contentMode = .scaleAspectFit
        obImageView.image = UIImage(named: onboardingImageName)
        
        obLabelView.translatesAutoresizingMaskIntoConstraints = false
        obLabelView.font = UIFont.preferredFont(forTextStyle: .title3)
        obLabelView.textAlignment = .center
        obLabelView.numberOfLines = 0
        obLabelView.adjustsFontForContentSizeCategory = true
        obLabelView.text = onboardingText
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
