//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    weak private var delegetaInController: InputProtocol?
    weak private var delegateFromCell: InputProtocol?
    weak private var delegateToProgresCell: OutputProtocol?
    weak private var delegateOutToCell: OutputProtocol?
    weak private var delegateOutToDetailVC: OutputProtocol?
    weak private var pressedButton: PressedButtonProtocol?
    
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
        reloadView()
    }
    
    private func reloadView() {
        let collectionView = delegetaInController?.delegateInController(info: UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
        collectionView?.reloadData()
    }
    
    private func getView() -> UIView {
        let view = HabitsView()
        delegetaInController = view
        return view
    }
    
    private func setupsCollectionView() {
        navigationController?.navigationBar.tintColor = Constants.navBarTintColor
        let collectionView = delegetaInController?.delegateInController(info: UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func setupHabitsViewController() {
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(presentCreateHabitVC))
    }
    
    @objc private func presentCreateHabitVC() {
        let controller = CreateHabitViewController(status: true)
        controller.navigationController?.navigationBar.tintColor = Constants.navBarTintColor
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 && HabitsStore.shared.habits.count != 0 {
            return 1
        } else {
            return HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "progressCell", for: indexPath) as? ProgressCustomCell {
                // set delegate to cell and sent todayProgress
                delegateToProgresCell = cell
                delegateToProgresCell?.delegateOut(info: HabitsStore.shared.todayProgress)
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "habitCell", for: indexPath) as? HabitCustomCell {
                delegateFromCell = cell
                delegateOutToCell = cell
                // make that controller delegator for reload view
                cell.reloadView = self
                let curentHabit = HabitsStore.shared.habits[indexPath.item]
                delegateOutToCell?.delegateOut(info: (curentHabit.isAlreadyTakenToday, indexPath.item))
                delegateFromCell?.delegateInController(info: curentHabit)
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
        delegateOutToDetailVC = controller
        let selectedHabit = HabitsStore.shared.habits[indexPath.item]
        delegateOutToDetailVC?.delegateOut(info: selectedHabit)
        navigationController?.pushViewController(controller, animated: true)
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

// extension for reload data in controller when button in cell pressed
extension HabitsViewController: ReloadProtocol {
    func reloadSomething<T>(info: T?) -> T? {
        reloadView()
        return nil
    }
}
