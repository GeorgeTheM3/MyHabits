//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private var delegetaInController: DelegateInController?
    private var delegateOutController: DelegateOutController?
    
    let insetsSize: CGFloat = 15
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
           return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "progressCell", for: indexPath) as? ProgressCustomCell {
                cell.backgroundColor = .white
                cell.clipsToBounds = true
                cell.layer.cornerRadius = 10
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitCell", for: indexPath) as? HabitCustomCell {
                delegateOutController = cell
                cell.backgroundColor = .white
                cell.clipsToBounds = true
                cell.layer.cornerRadius = 10
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected \(indexPath.row)")
        _ = delegateOutController?.delegateOut(info: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let spaces = CGFloat((numberOfItems + 1) * insetsSize)
        let cellWidth = (collectionViewWidth - spaces)/numberOfItems
        if indexPath.section == 0 {
            let cellHeith = cellWidth / 6
            return CGSize(width: cellWidth, height: cellHeith)
        } else {
            let cellHeith = cellWidth / 2.5
            return CGSize(width: cellWidth, height: cellHeith)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: insetsSize, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insetsSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insetsSize
    }
}
