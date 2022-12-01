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
        label.font = Constants.footnoteFont
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "habitCounterLabel"
        label.font = Constants.footnoteStatusFont
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitIndicatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.shadowOffset = Constants.setShadowOffsetMedium
        button.layer.shadowRadius = Constants.setShadowRadius
        button.layer.shadowOpacity = Constants.setShadowOpacityLow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func pressedButton(sender: UIButton) {
        let habit = HabitsStore.shared.habits[sender.tag]
        if habit.isAlreadyTakenToday {
            habit.trackDates.removeLast()
            HabitsStore.shared.save()
        } else {
            HabitsStore.shared.track(habit)
        }
        tapButtonAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
            self.reloadView?.reloadSomething(info: Void())
        })
//        reloadView?.reloadSomething(info: Void()) //DELETE
    }
    
    // animate tap button
    private func tapButtonAnimation() {
        UIView.animate(withDuration: 0.1) {
            self.habitIndicatorButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.habitIndicatorButton.transform = .identity
            }
            self.habitIndicatorButton.layoutIfNeeded()
        }
    }
    
    private func setButton(bool: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        if bool {
            let imageButton = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
            habitIndicatorButton.setImage(imageButton, for: .normal)
        } else {
            let imageButton = UIImage(systemName: "circle", withConfiguration: config)
            habitIndicatorButton.setImage(imageButton, for: .normal)
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
        addSubview(habitIndicatorButton)
    }
    
    private func setSubviewsConstraints() {
        NSLayoutConstraint.activate([
            habitTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            habitTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            habitTitleLabel.trailingAnchor.constraint(equalTo: habitIndicatorButton.leadingAnchor, constant: -20),
            
            habitTimeLabel.topAnchor.constraint(equalTo: habitTitleLabel.bottomAnchor, constant: 5),
            habitTimeLabel.leadingAnchor.constraint(equalTo: habitTitleLabel.leadingAnchor),
            habitTimeLabel.trailingAnchor.constraint(equalTo: habitTitleLabel.trailingAnchor),
            
            habitCounterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            habitCounterLabel.leadingAnchor.constraint(equalTo: habitTitleLabel.leadingAnchor),
            habitCounterLabel.trailingAnchor.constraint(equalTo: habitTitleLabel.trailingAnchor),
            
            habitIndicatorButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            habitIndicatorButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
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
            habitIndicatorButton.tintColor = habit.color
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
            habitIndicatorButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        }
        return nil
    }
}
