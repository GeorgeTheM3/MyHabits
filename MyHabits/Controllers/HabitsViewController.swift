//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private var delegetaInController: DelegateInController?
    
    override func loadView() {
        super.loadView()
        self.view = getView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupsCollectionView()
    }
    
    private func getView() -> UIView {
        let view = HabitsView()
        delegetaInController = view
        return view
    }
    
    private func setupsCollectionView() {
        let collectionView = delegetaInController?.delegateInController()
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func setupHabitsViewController() {
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension HabitsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
    }
}
