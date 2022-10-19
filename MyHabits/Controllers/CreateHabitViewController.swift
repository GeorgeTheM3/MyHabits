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
    private var delegateInView: InputProtocol?
    
    private var status: Bool
    private var curentHabit: Habit?
    
    init(status: Bool, curentHabit: Habit? = nil) {
        self.status = status
        self.curentHabit = curentHabit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = getView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHabitsViewController()
        delegateInView?.delegateInController(info: (status,curentHabit))
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
            if curentHabit == nil {
                HabitsStore.shared.habits.append(habit)
            } else {
                print("need update curent habit")
            }
        }
        dismiss(animated: true)
    }
    
    private func getView() -> UIView {
        let view = CreateHabitView()
        delegateOutView = view
        delegateInView = view
        return view
    }
}

