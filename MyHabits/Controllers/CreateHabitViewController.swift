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
    private var buttonsActions: PressedButtonProtocol?
    
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
        delegateInView?.delegateInController(info: (status, curentHabit))
        buttonActionDelete()
    }
    
    private func buttonActionDelete() {
        buttonsActions?.buttonPressed(selector: #selector(deleteHabit))
    }
    
    @objc private func deleteHabit() {
        alertController()
    }
    
    private func alertController() {
        let alertController = UIAlertController(title: "Удалить привычку", message: "Вы действительно хотите удалить привычку \(curentHabit!.name)", preferredStyle: .alert)
        let delete = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            HabitsStore.shared.habits.removeAll(where: {$0.name == self.curentHabit?.name && $0.date == self.curentHabit?.date})
            self.navigationController?.popToRootViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(cancel)
        alertController.addAction(delete)
        self.present(alertController, animated: true)
    }
    
    private func setupHabitsViewController() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Создать"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveCreateHabitVC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(dismissCreateHabitVC))
    }
    
    @objc private func dismissCreateHabitVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func saveCreateHabitVC() {
        if let habit = delegateOutView?.delegateOut(info: Habit(name: "", date: .now, color: .black)) {
            if curentHabit == nil {
                HabitsStore.shared.habits.append(habit)
            } else {
                if let index = HabitsStore.shared.habits.firstIndex(where: {$0.name == curentHabit?.name}) {
                    if let trackDates = curentHabit?.trackDates {
                        habit.trackDates = trackDates
                        HabitsStore.shared.habits[index] = habit
                    }
                }
            }
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func getView() -> UIView {
        let view = CreateHabitView()
        delegateOutView = view
        delegateInView = view
        buttonsActions = view
        return view
    }
}

