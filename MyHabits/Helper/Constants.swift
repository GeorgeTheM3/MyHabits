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
    let navBarTintColor:UIColor = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1)
    let customBlue: UIColor = UIColor(red: 41/255, green: 109/255, blue: 255/255, alpha: 1)
    let customGreen:UIColor = UIColor(red: 41/255, green: 109/255, blue: 255/255, alpha: 1)
    let customPurple: UIColor = UIColor(red: 98/255, green: 54/255, blue: 255/255, alpha: 1)
    let customOrange: UIColor = UIColor(red: 255/255, green: 159/255, blue: 79/255, alpha: 1)
    let customWhite: UIColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
    
    //Ключи
    enum Key {
        case create
        case rework
    }
}
