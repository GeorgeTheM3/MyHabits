//
//  CreateHabitViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 12.10.2022.
//

import Foundation
import UIKit

class CreateHabitViewController: UIViewController {
    
    private var delegateOutView: OutputProtocol?
    
    override func loadView() {
        super.loadView()
        self.view = getView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHabitsViewController()
    }
    
    private func setupHabitsViewController() {
        view.backgroundColor = .white
        navigationItem.title = "Создать"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveCreateHabitVC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(dismissCreateHabitVC))
    }
    
    @objc private func dismissCreateHabitVC() {
        dismiss(animated: true)
    }
    
    @objc private func saveCreateHabitVC() {
        if let habit = delegateOutView?.delegateOut(info: Habit(name: "", date: .now, color: .black)) {
            HabitsStore.shared.habits.append(habit)
        }
    }
    
    private func getView() -> UIView {
        let view = CreateHabitView()
        delegateOutView = view
        return view
    }
}
