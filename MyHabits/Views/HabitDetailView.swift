//
//  HabitDetailView.swift
//  MyHabits
//
//  Created by Георгий Матченко on 12.10.2022.
//

import Foundation
import UIKit

class HabitDetailView: UIView {
    private lazy var activityTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activityTableView)
        setSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(activityTableView)
        setSubviewsConstraints()
    }
    
    private func setSubviewsConstraints() {
        NSLayoutConstraint.activate([
            activityTableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            activityTableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
    }
}

extension HabitDetailView: InputProtocol {
    func delegateInController<T>(info: T?) -> T? {
        activityTableView as? T
    }
}
