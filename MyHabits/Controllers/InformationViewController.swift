//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class InformationViewController: UIViewController {
    private lazy var infoTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        textView.font = Constants.bodyFont
        textView.text = """
Привычка за 21 день

Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:

1. Провести 1 день без обращения
к старым привычкам, стараться вести себя так, как будто цель, загаданная
в перспективу, находится на расстоянии шага.

2. Выдержать 2 дня в прежнем состоянии самоконтроля.

3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,
с чем еще предстоит серьезно бороться.

4. Поздравить себя с прохождением первого серьезного порога в 21 день.
За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.

5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.

6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.
"""
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoViewController()
        appendSubviews()
        print("1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2")
    }
    
    override func viewWillLayoutSubviews() {
        print("3")
    }
    
    override func viewDidLayoutSubviews() {
        print("4")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("7")
    }
    
    private func setupInfoViewController() {
//        view.backgroundColor = .red
    }
    
    private func appendSubviews() {
        view.addSubview(infoTextView)
    }
}
