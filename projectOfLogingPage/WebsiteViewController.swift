//
//  ForgetViewController.swift
//  projectOfLogingPage
//
//  Created by R86 on 26/12/22.
//



import UIKit
import WebKit

class WebsiteViewController: UIViewController {
    
    
    @IBOutlet weak var websiteView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loardAWebsite()
    }
    private func loardAWebsite() {
        let url: URL = URL(string: "https://www.instagram.com/") as!  URL;
        websiteView.load(URLRequest(url: url))
    }
    
}



