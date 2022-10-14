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
    
    override func loadView() {
        super.loadView()
        self.view = getView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHabitsViewController()
    }
    
    private func setupHabitsViewController() {
        let a = delegateInController?.delegateInController(info: UITableView())
        a?.dataSource = self
        view.backgroundColor = .white
        navigationItem.title = "Название привычки"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(dismissCreateHabitVC))
    }
    
    @objc private func dismissCreateHabitVC() {
        dismiss(animated: true)
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
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
}
