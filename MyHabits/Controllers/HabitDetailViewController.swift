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
        let tableView = delegateInController?.delegateInController(info: UITableView())
        tableView?.dataSource = self
        tableView?.delegate = self
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
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
        // get date from storage
        let date = HabitsStore.shared.dates[indexPath.row]
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: indexPath.row)
        
        if let trackedDates = curentHabit?.trackDates {
            if trackedDates.contains(where: {$0.formatted(date: .complete, time: .omitted) == date.formatted(date: .complete, time: .omitted) }) {
                // create image view in cell for show checkmark
                let iconImageView = UIImageView()
                iconImageView.image = UIImage(systemName: "checkmark")
                cell.addSubview(iconImageView)
                // make constraints
                iconImageView.translatesAutoresizingMaskIntoConstraints = false
                iconImageView.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
                iconImageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
                iconImageView.widthAnchor.constraint(equalToConstant: (cell.bounds.height * 0.7)).isActive = true
                iconImageView.heightAnchor.constraint(equalToConstant: (cell.bounds.height * 0.7)).isActive = true
                iconImageView.tintColor = curentHabit?.color
                return cell
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Активность"
    }
}

extension HabitDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
