//
//  CommentWebViewController.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/15.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class CommentWebViewController: UIViewController , UIWebViewDelegate{

//    @IBOutlet weak var webView: UIWebView!
//    @IBOutlet weak var progressView: UIProgressView!
//    @IBOutlet weak var backButton: UIButton!
//    @IBOutlet weak var forwardButton: UIButton!
//    
//    private var hasFinishLoading = false
//    var shareTitle : String?
//    var url : NSURL!
//    
//    
//    //MARK: - view life cricle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let request = NSURLRequest(URL: url)
//        webView.loadRequest(request)
//        webView.delegate = self
//    }
//    
//    deinit{
////        webView.stopLoading()
////        webView.delegate = nil
//    }
//
//    override func didReceiveMemoryWarning() {
//        //super.didReceiveMemoryWarning()
//        if webView.loading {
//            webView.stopLoading()
//        }
//        
//        let alert = UIAlertController(title: "Stopped Loading", message: "This site is memory intensive and may cause a crash. Please use a browser instead.", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        alert.addAction(UIAlertAction(title: "Dismiss",
//            style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
//        }))
//        
//        alert.addAction(UIAlertAction(title: "Open in Safari",
//            style: UIAlertActionStyle.Default, handler: { (action) -> Void in
//                UIApplication.sharedApplication().openURL(self.url)
//                return
//        }))
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//    }
//    
//    
//    // MARK: - Action
//    @IBAction func backButtonDidPressed(sender: AnyObject) {
//        webView.goBack()
//    }
//    
//    @IBAction func forwardButtonDidPressed(sender: AnyObject) {
//        webView.goForward()
//    }
//    
//    
//    // MARK: - UIWebViewDelegate
//    
//    func webViewDidStartLoad(webView: UIWebView) {
//        
//        hasFinishLoading = false
//        updateProgress()
//    }
//    
//    func webViewDidFinishLoad(webView: UIWebView) {
//        
//        shareTitle = webView.stringByEvaluatingJavaScriptFromString("document.title");
//        //self.hasFinishLoading = true
//        delay(1) { [weak self] in
//            
//            guard let strongSelf = self else { return }
//            
//            strongSelf.hasFinishLoading = true
//            
////            if let _self = self {
////                _self.hasFinishLoading = true
////            }
//        }
//    }
//    
//    
//    // MARK: -
//    
//    func updateProgress() {
//        
//        if progressView.progress >= 1 {
//            progressView.hidden = true
//        } else {
//            
//            if hasFinishLoading {
//                progressView.progress += 0.002
//            } else {
//                if progressView.progress <= 0.3 {
//                    progressView.progress += 0.004
//                } else if progressView.progress <= 0.6 {
//                    progressView.progress += 0.002
//                } else if progressView.progress <= 0.9 {
//                    progressView.progress += 0.001
//                } else if progressView.progress <= 0.94 {
//                    progressView.progress += 0.0001
//                } else {
//                    progressView.progress = 0.9401
//                }
//            }
//            
//            delay(0.008) { [weak self] in
//                if let _self = self {
//                    _self.updateProgress()
//                }
//            }
//        }
//    }
//    
//    //TODO :what for
//
//    
//    //MARK: - delay func -
//    //TODO: explain
//    func delay(delay:Double, closure:()->()) {
//        dispatch_after(
//            dispatch_time(
//                DISPATCH_TIME_NOW,
//                Int64(delay * Double(NSEC_PER_SEC))
//            ),
//            dispatch_get_main_queue(), closure)
//    }

}
