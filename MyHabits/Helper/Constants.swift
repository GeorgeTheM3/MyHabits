//
//  Constants.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class Constants {
    static let shared = Constants()
    
    // Настройки create habit view
    let paddingTop = CGFloat(20)
    let paddingBetween = CGFloat(5)
    let paddingLeftAndRigh = CGFloat(60)
    let datePickerHeigh = CGFloat(200)
    
    // Шрифты
    let title3Font = UIFont.preferredFont(forTextStyle: .title3).withSize(20)
    let headlineFont = UIFont.preferredFont(forTextStyle: .headline).withSize(17)
    let bodyFont = UIFont.preferredFont(forTextStyle: .body).withSize(17)
    let footnoteFont = UIFont.preferredFont(forTextStyle: .footnote).withSize(13)
    let footnoteStatusFont = UIFont.preferredFont(forTextStyle: .footnote).withSize(13)
    
    //Цвета
    let navigationBarTintColor:UIColor = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1)
}
