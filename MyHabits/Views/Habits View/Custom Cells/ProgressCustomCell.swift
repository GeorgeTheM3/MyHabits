//
//  ProgressCustomCell.swift
//  MyHabits
//
//  Created by Георгий Матченко on 11.10.2022.
//

import Foundation
import UIKit

class ProgressCustomCell: UICollectionViewCell {
    private lazy var progressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressPercentLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.tintColor = Constants.navBarTintColor
        progressView.progress = HabitsStore.shared.todayProgress
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        self.clipsToBounds = true
        addSubviewsElements()
        setSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewsElements() {
        addSubview(progressTitleLabel)
        addSubview(progressPercentLabel)
        addSubview(progressView)
    }
    
    private func setSubviewsConstraints() {
        NSLayoutConstraint.activate([
            progressTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            progressTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            progressTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            progressPercentLabel.topAnchor.constraint(equalTo: progressTitleLabel.topAnchor),
            progressPercentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
