//
//  ViewController.swift
//  Status Bar
//
//  Created by Evan Bacon on 2/3/17.
//  Copyright © 2017 Brix. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupScrollView()
    }
    
}

extension ViewController {
    /// Get Status Bar
    fileprivate var statusBar: UIWindow? {
        return UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow
    }
    /// Build Generic Scroll View
    fileprivate func setupScrollView() {
        
        var scrollView:UIScrollView {
            let view = UIScrollView(frame: self.view.bounds)
            view.contentSize.height = 5000
            view.delegate = self
            return view
        }
        view.addSubview(scrollView)
        
        
        guard let statusBar = statusBar else {return}

        var colors = [UIColor.red, UIColor.blue, UIColor.orange, UIColor.cyan, UIColor.magenta]
        var index = 0
        for subview in statusBar.subviews {
            if let statusBar = subview as? UIView {
                for subview in statusBar.subviews {
                    print("Child A", subview)
                    for subview in subview.subviews {
                        print("Child B", subview)
                        
                        subview.layer.shadowColor = colors[index].cgColor
                        subview.layer.shadowOpacity = 1
                        subview.layer.shadowRadius = 0
                        subview.layer.shadowOffset = CGSize(width: 0, height: 100)
                        subview.frame.origin.y = -100
                        index += 1
                        for subview in subview.subviews {
                            print("Child C", subview)
                            
                            if let imageView = subview as? UIImageView {
                                imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
                                imageView.tintColor = UIColor.purple

                            }
                            

                        }
                    }
                }
            }
        }
    }
    
}
extension ViewController: UIScrollViewDelegate {
    /// Capture Scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        /// Bind Status Bar
        guard let statusBar = statusBar else {return}
        
        /// Get Content Offset
        let y = scrollView.contentOffset.y
        
        //Translate Status Bar
        statusBar.frame.origin.y = (y > 0) ? (-1 * y) : (-0.5 * y)
        
    }
}

