//
//  ViewController.swift
//  BaselineDemo
//
//  Created by Alen Liang on 21/03/2018.
//  Copyright © 2018 Alen Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onelineLabel: UILabel!
    @IBOutlet weak var twolineLabel: UILabel!
    @IBOutlet weak var onelineWithImageLabel: UILabel!
    @IBOutlet weak var twolineWithImageLabel: UILabel!
    @IBOutlet weak var onelineWithImageAndBaselineLabel: UILabel!
    @IBOutlet weak var twolineWithImageAndBaselineLabel: UILabel!
    
    @IBOutlet weak var height1: UILabel!
    @IBOutlet weak var height2: UILabel!
    @IBOutlet weak var height3: UILabel!
    @IBOutlet weak var height4: UILabel!
    @IBOutlet weak var height5: UILabel!
    @IBOutlet weak var height6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attributes = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0),
            NSAttributedStringKey.foregroundColor: UIColor.black,
        ]
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "picture")
        attachment.bounds = CGRect(
            x: 0, y: 0,
            width: attachment.image!.size.width, height: attachment.image!.size.height
        )
        let attributedStringWithImage = NSAttributedString(attachment: attachment)

        let string1 = NSMutableAttributedString()
        string1.append(attributedStringWithImage)
        string1.append(NSAttributedString(string: " hi there.", attributes: attributes))
        
        onelineWithImageLabel.attributedText = string1
        
        let string2 = NSMutableAttributedString()
        string2.append(attributedStringWithImage)
        string2.append(NSAttributedString(string: " i have multiple lines, maybe two.", attributes: attributes))
            
        twolineWithImageLabel.attributedText = string2
        twolineWithImageLabel.isHidden = true
        height4.isHidden = true
        let attributesWithBaseline: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0),
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.baselineOffset: 2,
        ]
        
        let string3 = NSMutableAttributedString()
        string3.append(attributedStringWithImage)
        string3.append(NSAttributedString(string: " hi there.", attributes: attributesWithBaseline))
        
        onelineWithImageAndBaselineLabel.attributedText = string3
        
        let string4 = NSMutableAttributedString()
        string4.append(attributedStringWithImage)
        string4.append(NSAttributedString(string: " i have multiple lines, maybe two.", attributes: attributesWithBaseline))
        
        twolineWithImageAndBaselineLabel.attributedText = string4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        height1.text = String(format:"%.2f", onelineLabel.bounds.height)
        height2.text = String(format:"%.2f", twolineLabel.bounds.height)
        height3.text = String(format:"%.2f", onelineWithImageLabel.bounds.height)
        height4.text = String(format:"%.2f", twolineWithImageLabel.bounds.height)
        height5.text = String(format:"%.2f", onelineWithImageAndBaselineLabel.bounds.height)
        height6.text = String(format:"%.2f", twolineWithImageAndBaselineLabel.bounds.height)
    }
}

