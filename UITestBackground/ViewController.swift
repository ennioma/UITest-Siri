//
//  ViewController.swift
//  UITestBackground
//
//  Created by Masi, Ennio (Senior iOS Developer) on 23/05/2017.
//  Copyright © 2017 Ennio Masi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainBtn: UIButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        self.mainBtn.accessibilityIdentifier = "mainBtnAccId"
    }
    
    @IBAction func btnTap() {
        if AppDelegate().loadedValue == 1 {
            self.performSegue(withIdentifier: "goToNextController", sender: nil)
        } else {
            let alert = UIAlertController(title: "test", message: "nice", preferredStyle: .alert)
            alert.accessibilityValue = "alertFoo"
            alert.addAction(UIAlertAction(title: "oK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

