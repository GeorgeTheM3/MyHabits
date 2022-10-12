//
//  CreateHabitViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 12.10.2022.
//

import Foundation
import UIKit

class CreateHabitViewController: UIViewController {
    
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(dismissCreateHabitVC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(dismissCreateHabitVC))
    }
    
    @objc private func dismissCreateHabitVC() {
        dismiss(animated: true)
    }
    
    
    private func getView() -> UIView {
        let view = CreateHabitView()
        return view
    }
}

