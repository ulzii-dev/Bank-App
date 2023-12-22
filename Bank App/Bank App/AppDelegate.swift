//
//  AppDelegate.swift
//  Bank App
//
//  Created by Saruululzii on 11/29/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let logoutViewController = LogoutViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow (frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        logoutViewController.logoutDelegate = self
        
        return true
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func loggedIn() {
        if LocalState.onboarded {
            setRootViewController(logoutViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func onboardingDone() {
        LocalState.onboarded = true
        setRootViewController(logoutViewController)
    }
}

extension AppDelegate: LogoutViewControllerDelegate {
    func loggedOut() {
        print("logged out!")
        setRootViewController(loginViewController)
    }
}
