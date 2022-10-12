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
        view.backgroundColor = .white
    }
    
    private func getView() -> UIView {
        let view = CreateHabitView()
        return view
    }
}

