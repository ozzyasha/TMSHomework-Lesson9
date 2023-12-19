//
//  ViewController.swift
//  TMSHomework-Lesson9
//
//  Created by Наталья Мазур on 18.12.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let circleView = UIView()
    let squareGreenView = UIView()
    let squareYellowView = UIView()
    let squareBlueView = UIView()
    
    let upButton = UIButton(type: .system)
    let downButton = UIButton(type: .system)
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)
    
    let squareButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupButtonsConstraints()
        setupSquareButton()
        setupButtons(button: upButton)
        setupButtons(button: downButton)
        setupButtons(button: leftButton)
        setupButtons(button: rightButton)
        setupCircleView()
        setupSquareGreenView()
        setupSquareYellowView()
        setupSquareBlueView()
    }
    
    func setupSquareGreenView() {
        squareGreenView.backgroundColor = UIColor.systemGreen
        squareGreenView.isHidden = true
    }
    func setupSquareYellowView() {
        squareYellowView.backgroundColor = UIColor.systemYellow
        squareYellowView.isHidden = true
    }
    func setupSquareBlueView() {
        squareBlueView.backgroundColor = UIColor.systemBlue
        squareBlueView.isHidden = true
    }
    
    func setupCircleView() {
        let viewCenterX = Int(view.center.x)
        let viewCenterY = Int(view.center.y)
        let circleSide = 50
        
        let frameCircle = CGRect(x: viewCenterX - circleSide / 2, y: viewCenterY - circleSide / 2, width: circleSide, height: circleSide)
        
        circleView.backgroundColor = UIColor.systemRed
        circleView.frame = frameCircle
        circleView.layer.cornerRadius = circleView.bounds.size.width / 2
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(circleViewTapped))
        circleView.addGestureRecognizer(gesture)
    }
    
    func setupSquareButton() {
        squareButton.setTitle("Квадраты", for: .normal)
        
        squareButton.backgroundColor = UIColor.systemGray6
        squareButton.layer.cornerRadius = 20
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        squareButton.addTarget(self, action: #selector(squareButtonTapped), for: .touchUpInside)
    }
    
    func setupButtons(button: UIButton) {
        switch button {
        case upButton:
            button.setTitle("👆", for: .normal)
            button.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        case downButton:
            button.setTitle("👇", for: .normal)
            button.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
        case leftButton:
            button.setTitle("👈", for: .normal)
            button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        case rightButton:
            button.setTitle("👉", for: .normal)
            button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        default:
            button.setTitle("No button", for: .normal)
        }
        
        button.backgroundColor = UIColor.systemGray6
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews() {
        view.addSubview(circleView)
        
        view.addSubview(squareButton)
        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(squareGreenView)
        view.addSubview(squareYellowView)
        view.addSubview(squareBlueView)
    }
    
    func setupButtonsConstraints() {
        upButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(UIScreen.main.bounds.size.width / 4 - 50)
            make.top.equalToSuperview().offset(70)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        downButton.snp.makeConstraints { make in
            make.left.equalTo(upButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        leftButton.snp.makeConstraints { make in
            make.left.equalTo(downButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        rightButton.snp.makeConstraints { make in
            make.left.equalTo(leftButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        squareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.size.height - 100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func circleViewTapped() {
        let safeAreaWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width)
        let upButtonBottom = Int(upButton.frame.maxY)
        let squareButtonTop = Int(squareButton.frame.minY)
        
        let circleSide = Int(circleView.bounds.size.width)
        
        circleView.frame = CGRect(x: Int.random(in: 1..<(safeAreaWidth - circleSide)), y: Int.random(in: (upButtonBottom + circleSide)..<(squareButtonTop - circleSide)), width: circleSide, height: circleSide)
    }
    
    @objc func upButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        
        if circleTop > Int(upButton.frame.maxY + 10) {
            circleView.frame = CGRect(x: circleLeft, y: circleTop - 10, width: circleSide, height: circleSide)
        }
    }
    
    @objc func downButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleBottom = Int(circleView.frame.maxY)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        
        if circleBottom < Int(squareButton.frame.minY - 10) {
            circleView.frame = CGRect(x: circleLeft, y: circleTop + 10, width: circleSide, height: circleSide)
        }
    }
    
    @objc func leftButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        if circleLeft > 10 {
            circleView.frame = CGRect(x: circleLeft - 10, y: circleTop, width: circleSide, height: circleSide)
        }
    }
    
    @objc func rightButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleRight = Int(circleView.frame.maxX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        if circleRight < Int(UIScreen.main.bounds.size.width) - 10 {
            circleView.frame = CGRect(x: circleLeft + 10, y: circleTop, width: circleSide, height: circleSide)
        }
    }
    
    @objc func squareButtonTapped() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let upButtonBottom = Int(upButton.frame.maxY)
        let squareButtonTop = Int(squareButton.frame.minY)
        let squareSide = 70
        
        squareGreenView.isHidden = false
        repeat{
            squareGreenView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareGreenView.frame.intersects(squareBlueView.frame) || squareGreenView.frame.intersects(squareYellowView.frame)
        
        squareYellowView.isHidden = false
        repeat {
            squareYellowView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareYellowView.frame.intersects(squareGreenView.frame) || squareYellowView.frame.intersects(squareBlueView.frame)
        
        squareBlueView.isHidden = false
        repeat {
            squareBlueView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareBlueView.frame.intersects(squareYellowView.frame) || squareBlueView.frame.intersects(squareGreenView.frame)
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
