//
//  WebViewVC.swift
//  Ajman DED
//
//  Created by Killvak on 09/01/2017.
//  Copyright © 2017 killvak. All rights reserved.
//

import UIKit
import WebKit
class WebViewVC: UIViewController , WKUIDelegate , WKNavigationDelegate  {
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    /*
     var webView: WKWebView!
     var progressBar = UIProgressView()
     
     override func loadView() {
     let webConfiguration = WKWebViewConfiguration()
     webView = WKWebView(frame: .zero, configuration: webConfiguration)
     webView.navigationDelegate = self
     progressBar = UIProgressView(frame: CGRect(x: 0, y: 64, width: self.view.frame.width, height: 70))
     progressBar.progress = 0.0
     progressBar.tintColor = UIColor.green
     webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil )
     webView.addSubview(progressBar)
     webView.uiDelegate = self
     view = webView
     }
     
     override func viewDidLoad() {
     super.viewDidLoad()
     
     let myURL = URL(string: "https://www.apple.com")
     let myRequest = URLRequest(url: myURL!)
     webView.allowsBackForwardNavigationGestures = true
     webView.load(myRequest)
     }
     
     
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
     self.navigationItem.title = webView.title
     }*/
    
    
    var webView  = WKWebView()
    var progressBar = UIProgressView()
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.squareLoading.start(0.0)
        
    }
    override func viewDidLoad() {
        
        
        webView =  WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let myURL = URL(string: "http://www.elmla3eb.com/about")
//        let myURL = URL(string: "https://www.apple.com")

        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.navigationDelegate = self
        progressBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 5))
        progressBar.progress = 0.0
        progressBar.tintColor = UIColor.green
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil )
        
        webView.addSubview(progressBar)
        view.addSubview(webView)
        webView.uiDelegate = self
        self.revealMenu()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        
        if  keyPath == "estimatedProgress" {
            self.progressBar.alpha = 1.0
            progressBar.setProgress(Float(self.webView.estimatedProgress), animated: true)
            print(progressBar.progress)
            if webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.progressBar.alpha = 0
                }, completion: { (finished : Bool ) -> Void in
                    self.progressBar.progress = 0
                    self.sideMenuBtn.tintColor = UIColor.white
                    self.sideMenuBtn.isEnabled = true 
                    self.view.squareLoading.stop(0.0)
                   
                    
                })
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
    
    

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.view.squareLoading.start(0.0)
        self.sideMenuBtn.tintColor = UIColor.clear
        self.sideMenuBtn.isEnabled = false
        print("didStartProvisionalNavigation")
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("failed to get data")
    }
    
}

/*
 
 var webView  = WKWebView()
 var progressBar = UIProgressView()
 
 override func viewDidLoad() {
 webView =  WKWebView(frame: CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height))
 let myURL = URL(string: "https://www.apple.com")
 let myRequest = URLRequest(url: myURL!)
 webView.load(myRequest)
 webView.navigationDelegate = self
 progressBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 5))
 progressBar.progress = 0.0
 progressBar.tintColor = UIColor.green
 webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil )
 
 webView.addSubview(progressBar)
 view.addSubview(webView)
 webView.uiDelegate = self
 }
 
 override func viewWillDisappear(_ animated: Bool) {
 webView.removeObserver(self, forKeyPath: "estimatedProgress")
 }
 override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
 if  keyPath == "estimatedProgress" {
 self.progressBar.alpha = 1.0
 progressBar.setProgress(Float(self.webView.estimatedProgress), animated: true)
 print(progressBar.progress)
 if webView.estimatedProgress >= 1.0 {
 UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: {
 self.progressBar.alpha = 0
 }, completion: { (finished : Bool ) -> Void in
 self.progressBar.progress = 0
 
 })
 }
 }
 }
 
 func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
 self.navigationItem.title = webView.title
 }
 
 
 
 
 }
 
 
 */
