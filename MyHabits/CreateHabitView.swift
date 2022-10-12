//
//  CreateHabitView.swift
//  MyHabits
//
//  Created by Георгий Матченко on 11.10.2022.
//

import Foundation
import UIKit

class CreateHabitView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Бегать по утрам, спать по 8 часов и т.п."
        textField.backgroundColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Цвет"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var colorPicker: UIColorWell = {
        let colorWell = UIColorWell()
        colorWell.supportsAlpha = true
        colorWell.selectedColor = .blue
        colorWell.title = "Color well"
        colorWell.backgroundColor = .blue
        colorWell.translatesAutoresizingMaskIntoConstraints = false
        return colorWell
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var choosenTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Каждый день в ...."
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setSubviewsCostreints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setSubviewsCostreints()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(enterTitleTextField)
        addSubview(colorLabel)
        addSubview(colorPicker)
        addSubview(timeLabel)
        addSubview(choosenTimeLabel)
    }
    
    private func setSubviewsCostreints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.shared.paddingTop),
            titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.shared.paddingLeftAndRigh),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            enterTitleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            enterTitleTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            colorLabel.topAnchor.constraint(equalTo: enterTitleTextField.bottomAnchor, constant: Constants.shared.paddingTop),
            colorLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.shared.paddingLeftAndRigh),
            colorLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            colorPicker.topAnchor.constraint(equalTo: colorLabel.bottomAnchor),
            colorPicker.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: colorPicker.bottomAnchor, constant: Constants.shared.paddingTop),
            timeLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.shared.paddingLeftAndRigh),
            timeLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            choosenTimeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            choosenTimeLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
        ])
    }
}
