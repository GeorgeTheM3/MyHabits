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
        collectionView.backgroundColor = Constants.customWhite
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsElements()
        setConstraintsSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviewsElements()
        setConstraintsSubviews()
    }
    
    private func addSubviewsElements() {
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

extension HabitsView: InputProtocol {
    func delegateInController<T>(info: T?) -> T? {
        habitsCollectionView as? T
    }
}
