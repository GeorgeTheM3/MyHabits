//
//  HabitCustomCell.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class HabitCustomCell: UICollectionViewCell {
    private(set) lazy var habitTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "habitTitleLabel"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var habitTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "habitTimeLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var habitCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "habitCounterLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var habitIndicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(habitTitleLabel)
        addSubview(habitTimeLabel)
        addSubview(habitCounterLabel)
        addSubview(habitIndicatorImageView)
    }
    
    private func setSubviewsConstraints() {
        NSLayoutConstraint.activate([
            habitTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            habitTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitTitleLabel.trailingAnchor.constraint(equalTo: habitIndicatorImageView.leadingAnchor, constant: -20),
            
            habitTimeLabel.topAnchor.constraint(equalTo: habitTitleLabel.bottomAnchor, constant: 5),
            habitTimeLabel.leadingAnchor.constraint(equalTo: habitTitleLabel.leadingAnchor),
            habitTimeLabel.trailingAnchor.constraint(equalTo: habitTitleLabel.trailingAnchor),
            
            habitCounterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            habitCounterLabel.leadingAnchor.constraint(equalTo: habitTitleLabel.leadingAnchor),
            habitCounterLabel.trailingAnchor.constraint(equalTo: habitTitleLabel.trailingAnchor),
            
            habitIndicatorImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            habitIndicatorImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            habitIndicatorImageView.widthAnchor.constraint(equalToConstant: (self.frame.height)/CGFloat(3)),
            habitIndicatorImageView.heightAnchor.constraint(equalToConstant: (self.frame.height)/CGFloat(3))
        ])
    }
}

extension HabitCustomCell: OutputProtocol {
    func delegateOut<T>(info: T?) -> T? {
        if let bool = info as? Bool {
            habitIndicatorImageView.image = bool ? UIImage(systemName: "") : UIImage(systemName: "circle")
        }
        return nil
    }
}
