//
//  DelegateInController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

protocol DelegateInController: AnyObject {
    func delegateInController() -> UICollectionView
}
