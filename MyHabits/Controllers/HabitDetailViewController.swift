//
//  HabitDetailViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 12.10.2022.
//

import Foundation
import UIKit

class HabitDetailViewController: UIViewController {
    
    private weak var delegateInController: InputProtocol?
    
    private var curentHabit: Habit?
    
    override func loadView() {
        super.loadView()
        self.view = getView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHabitsViewController()
    }
    
    private func setupHabitsViewController() {
        navigationItem.largeTitleDisplayMode = .never
        let tableView = delegateInController?.delegateInController(info: UITableView())
        tableView?.dataSource = self
        view.backgroundColor = .white
        navigationItem.title = "Название привычки"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(createHabitVC))
    }
    
    @objc private func createHabitVC() {
        let navigationController = UINavigationController(rootViewController: CreateHabitViewController(status: false, curentHabit: curentHabit))
        navigationController.navigationBar.tintColor = Constants.navBarTintColor
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    
    private func getView() -> UIView {
        let view = HabitDetailView()
        delegateInController = view
        return view
    }
}

extension HabitDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        cell.textLabel?.text = curentHabit?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
}

extension HabitDetailViewController: OutputProtocol {
    func delegateOut<T>(info: T?) -> T? {
        if let habit = info as? Habit {
            curentHabit = habit
        }
        return nil
    }
}
