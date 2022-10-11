//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private var delegetaInController: DelegateInController?
    
    let insetsSize: CGFloat = 20
    let numberOfItems: CGFloat = 1
    
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
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitCell", for: indexPath) as? HabitCustomCell {
            cell.backgroundColor = .systemGray5
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let collectionViewWidth = delegetaInController?.delegateInController().frame.width {
            let spaces = CGFloat((numberOfItems + 1) * insetsSize)
            let cellWidth = (collectionViewWidth - spaces)/numberOfItems
            return CGSize(width: cellWidth, height: 120)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insetsSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insetsSize
    }
}
