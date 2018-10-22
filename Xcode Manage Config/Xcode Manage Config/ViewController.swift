//
//  ViewController.swift
//  Xcode Manage Config
//
//  Created by Andrew Jaffee on 10/18/18.
//
/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
*/

import Cocoa

let reverseDomain = "us.microit."

class ViewController: NSViewController {
    
    @IBOutlet weak var logoImage: NSImageView!
    @IBOutlet weak var productName: NSTextField!
    @IBOutlet weak var copyright: NSTextField!
    @IBOutlet weak var version: NSTextField!
    
    var helpPath: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Get the product name by stripping out the
        // reverse domain name.
        let bundleIdentifier = Bundle.main.bundleIdentifier?.replacingOccurrences(of: reverseDomain, with: "")
        
        // Display the product name.
        productName.stringValue = bundleIdentifier!
        
        // Build app icon set name using concatenation.
        let appIconSetName:String = bundleIdentifier! + "AppIcon"
        // Get and display the product logo.
        logoImage.image = NSImage(named: NSImage.Name(rawValue: appIconSetName))
        
        // Get the copyright statement.
        let copyrightString = Bundle.main.object(forInfoDictionaryKey: "NSHumanReadableCopyright")
        // Display the product copyright.
        copyright.stringValue = copyrightString! as! String
        
        // Get the product version.
        let versionString = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        // Display the version.
        version.stringValue = "Version: " + (versionString! as! String)
        
        // Build and save the path to help files.
        helpPath = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: bundleIdentifier!)!
        
    } // end func viewDidLoad()
    
    @IBAction func invokeHelp(_ sender: Any) {
        // Open help in default browser.
        NSWorkspace.shared.openFile(helpPath)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

} // end class ViewController

