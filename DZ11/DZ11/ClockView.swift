//
//  ClockView.swift
//  DZ11
//
//  Created by Kristina Kudinova on 23.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

@IBDesignable class ClockView: UIView {
    
    let markerWidth: CGFloat = 4
    let markerLenght: CGFloat = 10
    let markerColor = UIColor.systemPink
    private let hourLine = UIView()
    private var minuteLine = UIView()
    private var secondsLine = UIView()
    private let roundedView = UIView()
    private let topMarker = UIView()
    private let bottomMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    
    //Часы
    @IBInspectable private var hourLineColor: UIColor = UIColor.blue {
        didSet {
            hourLine.backgroundColor = hourLineColor
        }
    }
    @IBInspectable var hours: CGFloat = 7 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable private var hourLineHeight: CGFloat = 50 {
        didSet {
            updateClockHandFrame(clockHand: hourLine, width: hourLineWidth, height: hourLineHeight)
        }
    }
    @IBInspectable private var hourLineWidth: CGFloat = 7 {
        didSet {
            updateClockHandFrame(clockHand: hourLine, width: hourLineWidth, height: hourLineHeight)
        }
    }
    
    //Минуты
    @IBInspectable private var minuteLineColor: UIColor = UIColor.green {
        didSet {
            minuteLine.backgroundColor = minuteLineColor
        }
    }
    @IBInspectable var minutes: CGFloat = 3 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable private var minuteLineHeight: CGFloat = 30 {
        didSet {
            updateClockHandFrame(clockHand: minuteLine, width: minuteLineWidth, height: minuteLineHeight)
        }
    }
    @IBInspectable private var minuteLineWidth: CGFloat = 5 {
        didSet {
            updateClockHandFrame(clockHand: minuteLine, width: minuteLineWidth, height: minuteLineHeight)
        }
    }
    
    //Секунды
    @IBInspectable private var secondsLineColor: UIColor = UIColor.green {
        didSet {
            secondsLine.backgroundColor = secondsLineColor
        }
    }
    @IBInspectable var seconds: CGFloat = 45 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable private var secondsLineHeight: CGFloat = 20 {
        didSet {
            updateClockHandFrame(clockHand: secondsLine, width: secondsLineWidth, height: secondsLineHeight)
        }
    }
    @IBInspectable private var secondsLineWidth: CGFloat = 10 {
        didSet {
            updateClockHandFrame(clockHand: secondsLine, width: secondsLineWidth, height: secondsLineHeight)
        }
    }
    
    //центр круга часов
    @IBInspectable private var roundedViewColor: UIColor = UIColor.blue {
        didSet{
            roundedView.backgroundColor = roundedViewColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawClockFace()
    }
    
    override func draw(_ rect: CGRect) {
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondsLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        updateClockHandFrame(clockHand: hourLine, width: hourLineWidth, height: hourLineHeight)
        updateHours()
        
        updateClockHandFrame(clockHand: minuteLine, width: minuteLineWidth, height: minuteLineHeight)
        updateMinutes()
        
        updateClockHandFrame(clockHand: secondsLine, width: secondsLineWidth, height: secondsLineHeight)
        updateSeconds()
    }
    
    //Отрисовываем часы
    private func drawClockFace() {
        let w = self.frame.size.width
        let h = self.frame.size.height
        let roundedViewSize: CGFloat = 16
        
        self.layer.cornerRadius = w / 2
        self.layer.masksToBounds = true
        
        //Маркеры, которые показывают где находятся 12, 3, 6 и 9 часов
        topMarker.frame = CGRect(x:  w / 2 - markerWidth / 2, y: 0, width: markerWidth, height: markerLenght)
        bottomMarker.frame = CGRect(x: w / 2 - markerWidth / 2, y: h - markerLenght, width: markerWidth, height: markerLenght)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerWidth / 2, width: markerLenght, height: markerWidth)
        rightMarker.frame = CGRect(x: w - markerLenght, y: h / 2 - markerWidth / 2, width: markerLenght, height: markerWidth)
        for v in [topMarker, bottomMarker, leftMarker, rightMarker] {
            v.backgroundColor = markerColor
        }
        
        //Маркер - середина круга, точка от которой идут все стрелки
        roundedView.frame = CGRect(x: w / 2 - roundedViewSize / 2, y: h / 2 - roundedViewSize / 2, width: roundedViewSize, height: roundedViewSize)
        roundedView.layer.cornerRadius = roundedViewSize / 2
        roundedView.backgroundColor = roundedViewColor
        
        //Добавляем все маркеры на вью
        for v in [topMarker, bottomMarker, leftMarker, rightMarker, minuteLine, hourLine, secondsLine, roundedView] {
            self.addSubview(v)
        }
    }
    
    //Функция для обновления фрейма стрелок при изменении значений
    private func updateClockHandFrame(clockHand: UIView, width: CGFloat, height: CGFloat ) {
        clockHand.translatesAutoresizingMaskIntoConstraints = false
        
        clockHand.frame.size = CGSize(width: width, height: height)
        clockHand.frame.origin.x = topMarker.center.x - width / 2
        clockHand.frame.origin.y = self.frame.height / 2 - height
    }
    
    //Функции, которые двигают стрелки при изменении времени
    private func updateHours() {
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    private func updateMinutes() {
        let angle = minutes * 6 * CGFloat.pi / 180
        minuteLine.transform = .init(rotationAngle: angle)
    }
    
    private func updateSeconds() {
        let angle = seconds * 6 * CGFloat.pi / 180
        secondsLine.transform = .init(rotationAngle: angle)
    }
}
