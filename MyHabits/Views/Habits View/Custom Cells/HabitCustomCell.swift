//
//  HabitCustomCell.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class HabitCustomCell: UICollectionViewCell {
    // property for delegate
    var reloadView: ReloadProtocol?
    
    private lazy var habitTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "habitTitleLabel"
        label.numberOfLines = 2
        label.font = Constants.headlineFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "habitTimeLabel"
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "habitCounterLabel"
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitIndicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var habitIndicatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func pressedButton(sender: UIButton) {
        // reload view when button pressed
        reloadView?.reloadSomething(info: Void())
        // get selected habit
        let habit = HabitsStore.shared.habits[sender.tag]
        // change indcator image
        if habit.isAlreadyTakenToday {
            habitIndicatorImageView.image = UIImage(systemName: "circle")
            habit.trackDates.removeLast()
            HabitsStore.shared.save()
        } else {
            habitIndicatorImageView.image = UIImage(systemName: "checkmark.circle.fill")
            HabitsStore.shared.track(habit)
        }
    }
    
    private func setButton(bool: Bool) {
        if bool {
            habitIndicatorImageView.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            habitIndicatorImageView.image = UIImage(systemName: "circle")
        }
    }
    
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
        addSubview(habitTitleLabel)
        addSubview(habitTimeLabel)
        addSubview(habitCounterLabel)
        addSubview(habitIndicatorImageView)
        addSubview(habitIndicatorButton)
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
            habitIndicatorImageView.heightAnchor.constraint(equalToConstant: (self.frame.height)/CGFloat(3)),
            
            habitIndicatorButton.centerYAnchor.constraint(equalTo: habitIndicatorImageView.centerYAnchor),
            habitIndicatorButton.centerXAnchor.constraint(equalTo: habitIndicatorImageView.centerXAnchor),
            habitIndicatorButton.widthAnchor.constraint(equalToConstant: (self.frame.height)/CGFloat(3)),
            habitIndicatorButton.heightAnchor.constraint(equalToConstant: (self.frame.height)/CGFloat(3))
        ])
    }
}

extension HabitCustomCell: InputProtocol {
    func delegateInController<T>(info: T?) -> T? {
        if let habit = info as? Habit {
            habitTitleLabel.text = habit.name
            habitTitleLabel.textColor = habit.color
            habitTimeLabel.text = habit.dateString
            habitIndicatorImageView.tintColor = habit.color
            habitCounterLabel.text = "Счетчик: \(habit.trackDates.count)"
        }
        return nil
    }
}

extension HabitCustomCell: OutputProtocol {
    func delegateOut<T>(info: T?) -> T? {
        if let data = info as? (Bool, Int){
            setButton(bool: data.0)
            habitIndicatorButton.tag = data.1
            habitIndicatorImageView.tag = data.1
            habitIndicatorButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        }
        return nil
    }
}
