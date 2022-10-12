//
//  HabitsView.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class HabitsView: UIView {
    private lazy var habitsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HabitCustomCell.self, forCellWithReuseIdentifier: "habitCell")
        collectionView.register(ProgressCustomCell.self, forCellWithReuseIdentifier: "progressCell")
        collectionView.backgroundColor = .systemGray6
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraintsSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setConstraintsSubviews()
    }
    
    private func addSubviews() {
        addSubview(habitsCollectionView)
    }
    
    private func setConstraintsSubviews() {
        NSLayoutConstraint.activate([
            habitsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            habitsCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            habitsCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HabitsView: DelegateInController {
    func delegateInController() -> UICollectionView {
        habitsCollectionView
    }
}

//extension HabitsView: DelegateInControllerGeneric {
//    func delegateInController<T>(info: T?) -> T? {
//        habitsCollectionView as? T
//    }
//}
