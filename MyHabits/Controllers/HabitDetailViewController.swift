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
        navigationItem.title = curentHabit?.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(createHabitVC))
    }
    
    @objc private func createHabitVC() {
        let controller = CreateHabitViewController(status: false, curentHabit: curentHabit)
        navigationController?.navigationBar.tintColor = Constants.navBarTintColor
        navigationController?.pushViewController(controller, animated: true)
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
        let date = HabitsStore.shared.dates[indexPath.row]
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: indexPath.row)
        if let trackedDates = curentHabit?.trackDates {
            if trackedDates.contains(where: {$0.formatted(date: .complete, time: .omitted) == date.formatted(date: .complete, time: .omitted) }) {
                cell.backgroundColor = curentHabit?.color
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
}

extension HabitDetailViewController: OutputProtocol {
    func delegateOut<T>(info: T?) -> T? {
        if let habit = info as? Habit {
            curentHabit = habit
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Активность"
    }
}
