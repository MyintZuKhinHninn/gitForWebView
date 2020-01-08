//
//  WKTestingViewController.swift
//  WebViewTesting
//
//  Created by TechFun on 6/5/19.
//  Copyright © 2019 TechFun. All rights reserved.
//

import UIKit
import WebKit

class WKTestingViewController: UIViewController {
    
    @IBOutlet weak var TopView: UIView!
    
    @IBOutlet weak var BottomView: UIView!
    
    @IBOutlet weak var showTextField: UITextField!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet var backUIView: UIView!
    
    public var myActivityIndicatior = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicatior.center = self.view.center
        myActivityIndicatior.style = .gray
        view.addSubview(myActivityIndicatior)
       // self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
    }

    @IBAction func searchAction(_ sender: Any) {
        if let urlString = showTextField.text{
            let url = NSURL(string: urlString)
            let request = NSURLRequest(url: url! as URL)
            if urlString.starts(with: "http://") || urlString.starts(with: "https://"){
                webView.load(request as URLRequest)
            }else if  urlString.contains("www"){
                webView.load(request as URLRequest)
            } else{
                searchOnGoogle(text: urlString)
            }
        }
    }
    func searchOnGoogle(text: String) {
        let textComponent = text.components(separatedBy: " ")
        let searchString = textComponent.joined(separator: "+")

        let url = URL(string: "https://www.google.com/search?q=" + searchString)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        self.hideView()
        self.view.addSubview(backUIView)
        self.backUIView.isHidden = false
        self.setupLayout()
    }
    func hideView(){
        TopView.isHidden = true
        BottomView.isHidden = true
    }
 
//    @IBAction func backAction(_ sender: Any) {
//
//        let viewController = UIStoryboard(name: "WKTesting", bundle: nil).instantiateViewController(withIdentifier: "BackID")
//        self.present(viewController, animated: true, completion: nil)
//
//    }
    
    func setupLayout(){
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }

    @IBAction func backBtnAction(_ sender: Any) {
        let backController = UIStoryboard(name: "QNA", bundle: nil).instantiateViewController(withIdentifier: "QNAID")
        self.present(backController, animated: true, completion: nil)
        
    }
    override var prefersStatusBarHidden: Bool{
    return true
    }
}

