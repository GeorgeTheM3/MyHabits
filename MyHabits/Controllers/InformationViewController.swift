//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class InformationViewController: UIViewController {
    private lazy var infoTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        textView.font = Constants.bodyFont
        textView.text = "text"
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoViewController()
        appendSubviews()
        loadText(fileName: "habitInfo")
    }
    
    private func loadText(fileName: String) {
        if let rtfPath = Bundle.main.url(forResource: fileName, withExtension: "rtf") {
               do {
                   let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                   self.infoTextView.attributedText = attributedStringWithRtf
               } catch let error {
                   print("Got an error \(error)")
               }
           }
    }
    
    private func setupInfoViewController() {
//        view.backgroundColor = .red
    }
    
    private func appendSubviews() {
        view.addSubview(infoTextView)
    }
}
