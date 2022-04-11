//
//  SplashScreenController.swift
//  OnBudget
//
//  Created by Nur Mutmainnah Rahim on 09/04/22.
//

import UIKit

class SplashScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 2 seconds
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.performSegue(withIdentifier: "GoToLandingPage", sender: nil)
        }
        view.backgroundColor = UIColor(red: 0.20, green: 0.38, blue: 0.73, alpha: 1.00)
    }
}
