//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private var delegetaInController: InputProtocol?
    private var delegateOutController: OutputProtocol?
    
    let insetsSize: CGFloat = 15
    let numberOfItems: CGFloat = 1
    
    override func loadView() {
        super.loadView()
        self.view = getView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupsCollectionView()
        setupHabitsViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    private func getView() -> UIView {
        let view = HabitsView()
        delegetaInController = view
        return view
    }
    
    private func setupsCollectionView() {
        navigationController?.navigationBar.tintColor = Constants.shared.navigationBarTintColor
        let collectionView = delegetaInController?.delegateInController(info: UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func setupHabitsViewController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(presentCreateHabitVC))
    }
    
    @objc private func presentCreateHabitVC() {
        let navigationController = UINavigationController(rootViewController: CreateHabitViewController())
        navigationController.navigationBar.tintColor = Constants.shared.navigationBarTintColor
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
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
        guard indexPath.section != 0 else { return }
        let controller = HabitDetailViewController()
        navigationController?.pushViewController(controller, animated: true)
        print(HabitsStore.shared.habits.count)
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


let a = Habit(name: "ff", date: .now , color: .blue)
