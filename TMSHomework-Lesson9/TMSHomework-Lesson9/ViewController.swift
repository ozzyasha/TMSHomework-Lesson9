//
//  ViewController.swift
//  TMSHomework-Lesson9
//
//  Created by Наталья Мазур on 18.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    let circleView = UIView()
    let squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupCircleView()
    }
    
    func setupCircleView() {
        let safeAreaWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width)
        let safeAreaHeight = Int(view.safeAreaLayoutGuide.layoutFrame.size.height)
        let safeAreaTop = Int(view.safeAreaInsets.top)
        let circleSide = 50
        
        let frameCircle = CGRect(x: Int.random(in: (1 + circleSide)..<(safeAreaWidth - circleSide)), y: Int.random(in: safeAreaTop..<(safeAreaHeight - circleSide)), width: circleSide, height: circleSide)
        
        circleView.backgroundColor = UIColor.red
        circleView.frame = frameCircle
        circleView.layer.cornerRadius = circleView.bounds.size.width / 2
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        circleView.addGestureRecognizer(gesture)
    }
    
    func addSubviews() {
        view.addSubview(circleView)
    }
    
    @objc func viewTapped() {
        let safeAreaWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width)
        let safeAreaHeight = Int(view.safeAreaLayoutGuide.layoutFrame.size.height)
        let safeAreaTop = Int(view.safeAreaInsets.top)
        let circleSide = Int(circleView.bounds.size.width)
        
        circleView.frame = CGRect(x: Int.random(in: (1 + circleSide)..<(safeAreaWidth - circleSide)), y: Int.random(in: safeAreaTop..<(safeAreaHeight - circleSide)), width: circleSide, height: circleSide)
    }

}

//- ДЗ:
//• Функция Random - самостоятельно, найти и изучить применение
//• Игрушка для котиков - появление разноцветного кружочка, по тапу
//исчезает и появляется в новом месте (кодом)
//
//• По нажатию кнопки экран заполняется разноцветными квадратами (3 штуки) с
//фиксированной стороной. Квадраты не пересекаются
//
//• На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо,
//влево. При нажатии кнопки кружок перемещается на фиксированное
//расстояние. За края экрана не выходит, на кнопки не налезает
