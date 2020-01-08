//
//  ViewController.swift
//  WebViewTesting
//
//  Created by TechFun on 6/5/19.
//  Copyright © 2019 TechFun. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var showWebView: WKWebView!
    
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loading()
        // Do any additional setup after loading the view.
    }
    
    func loading(){
        let myurl = URL(string: "https://www.google.com")
        let myrequest = URLRequest(url: myurl!)
        showWebView.load(myrequest)
        print("Webpage Loaded Successfully")
    }

    public  func webViewDidStartLoad(_ webView: UIWebView){
            print("WebViewDidStartLoad")
        loadSpinner.isHidden = false
        loadSpinner.startAnimating()
        }
        
    public func webViewDidFinishLoad(_ webView: UIWebView){
            print("WebViewDidFinishLoad")
        loadSpinner.stopAnimating()
        loadSpinner.isHidden = true
        }
       
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
            print("didFailLoadWithError")
        loadSpinner.stopAnimating()
        loadSpinner.isHidden = true
        }
    }



