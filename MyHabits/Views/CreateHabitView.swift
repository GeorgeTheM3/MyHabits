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
        label.text = "НАЗВАНИЕ"
        label.font = Constants.footnoteFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Бегать по утрам, спать по 8 часов и т.п."
        textField.font = Constants.footnoteStatusFont
        textField.textColor = colorPicker.selectedColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "ЦВЕТ"
        label.font = Constants.footnoteFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var colorPicker: UIColorWell = {
        let colorWell = UIColorWell()
        colorWell.supportsAlpha = true
        colorWell.selectedColor = .blue
        colorWell.title = "Color well"
        colorWell.translatesAutoresizingMaskIntoConstraints = false
        colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        return colorWell
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ"
        label.font = Constants.footnoteFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var choosenTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Каждый день в ...."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsElements()
        setSubviewsCostreints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviewsElements()
        setSubviewsCostreints()
    }
    
    @objc private func colorChanged() {
        enterTitleTextField.textColor = colorPicker.selectedColor
    }
    
    @objc private func timeChanged() {
        choosenTimeLabel.text = "Каждый день в \(datePicker.date.formatted(date: .omitted, time: .shortened))"
    }
    
    private func addSubviewsElements() {
        addSubview(titleLabel)
        addSubview(enterTitleTextField)
        addSubview(colorLabel)
        addSubview(colorPicker)
        addSubview(timeLabel)
        addSubview(choosenTimeLabel)
        addSubview(datePicker)
    }
    
    private func setSubviewsCostreints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.paddingTop),
            titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.paddingLeftAndRigh),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            enterTitleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.paddingBetween),
            enterTitleTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            enterTitleTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant:  -Constants.paddingLeftAndRigh),
            
            colorLabel.topAnchor.constraint(equalTo: enterTitleTextField.bottomAnchor, constant: Constants.paddingTop),
            colorLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.paddingLeftAndRigh),
            colorLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            colorPicker.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: Constants.paddingBetween),
            colorPicker.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: colorPicker.bottomAnchor, constant: Constants.paddingTop),
            timeLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -Constants.paddingLeftAndRigh),
            timeLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            choosenTimeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: Constants.paddingBetween),
            choosenTimeLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: choosenTimeLabel.bottomAnchor, constant: Constants.paddingTop),
            datePicker.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: Constants.datePickerHeigh)
            
        ])
    }
}

extension CreateHabitView: OutputProtocol {
    func delegateOut<T>(info: T?) -> T? {
        if let title = enterTitleTextField.text, let color = colorPicker.selectedColor {
            return Habit(name: title, date: datePicker.date, color: color ) as? T
        }
        return nil
    }
}
