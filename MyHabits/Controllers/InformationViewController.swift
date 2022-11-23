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
        print("1")
    }
    
    private func loadText(fileName: String) {
//        guard let path = Boundle.main.url(forResource: "habitInfo", withExtension: )
    }
    
    private func setupInfoViewController() {
//        view.backgroundColor = .red
    }
    
    private func appendSubviews() {
        view.addSubview(infoTextView)
    }
}
