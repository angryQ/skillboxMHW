//
//  ClockView.swift
//  DZ11
//
//  Created by Kristina Kudinova on 23.12.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

@IBDesignable class ClockView: UIView {
    
    var isSetuped = false
    let markerWidth: CGFloat = 4
    let markerLenght: CGFloat = 10
    let markerColor = UIColor.systemPink
    private let hourLine = UIView()
    private let roundedView = UIView()
    private var minuteLine = UIView()
    private var secondsLine = UIView()
    private let topMarker = UIView()
    private let bottomMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    
//    private var hourLineSize: CGFloat = 4
//    private var hourLineOffset: CGFloat = 40
    
//    private var minuteLineSize: CGFloat = 4
//    private var minuteLineOffset: CGFloat = 40
//
//    private var secondLineSize: CGFloat = 3
//    private var secondLineOffset: CGFloat = 20
//
    
    //центр круга часов
    @IBInspectable private var roundedViewColor: UIColor = UIColor.blue {
        didSet{
            roundedView.backgroundColor = roundedViewColor
        }
    }
    
    //Часы
    @IBInspectable var hours: CGFloat = 7 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable private var hourLineHeight: CGFloat = 10 {
        didSet {
            updateHourLineFrame(width: hourLineWidth, height: hourLineHeight)
        }
    }
    @IBInspectable private var hourLineWidth: CGFloat = 10 {
        didSet {
           updateHourLineFrame(width: hourLineWidth, height: hourLineHeight)
        }
    }
    @IBInspectable private var hourLineColor: UIColor = UIColor.blue {
        didSet {
            hourLine.backgroundColor = hourLineColor
        }
    }
   
    //Минуты
    @IBInspectable var minutes: CGFloat = 3 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable private var minuteLineHeight: CGFloat = 10 {
        didSet {
            updateMinuteLineFrame(width: minuteLineWidth, height: minuteLineHeight)
        }
    }
    @IBInspectable private var minuteLineWidth: CGFloat = 10 {
        didSet {
            updateMinuteLineFrame(width: minuteLineHeight, height: minuteLineWidth)
        }
    }
    @IBInspectable private var minuteLineColor: UIColor = UIColor.green {
        didSet {
            minuteLine.backgroundColor = minuteLineColor
        }
    }
    
    //Секунды
    @IBInspectable var seconds: CGFloat = 45 {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable private var secondsLineHeight: CGFloat = 10 {
        didSet {
            updateSecondsLineFrame(width: secondsLineWidth, height: secondsLineHeight)
        }
    }
    @IBInspectable private var secondsLineWidth: CGFloat = 10 {
        didSet {
            updateSecondsLineFrame(width: secondsLineHeight, height: secondsLineWidth)
        }
    }
    @IBInspectable private var secondsLineColor: UIColor = UIColor.green {
        didSet {
            secondsLine.backgroundColor = secondsLineColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func updateHours() {
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    func updateHourLineFrame(width: CGFloat, height: CGFloat) {
        hourLine.translatesAutoresizingMaskIntoConstraints = false
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        hourLine.frame = CGRect(x: frame.size.width / 2 - width / 2, y: height, width: width, height: bounds.height / 2 - height)
        drawClockFace()
    }
    
    func updateMinutes() {
        let angle = minutes * 6 * CGFloat.pi / 180
        minuteLine.transform = .init(rotationAngle: angle)
    }
    
    func updateMinuteLineFrame(width: CGFloat, height: CGFloat) {
        minuteLine.translatesAutoresizingMaskIntoConstraints = false
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        minuteLine.frame = CGRect(x: frame.size.width / 2 - width / 2, y: height, width: width, height: bounds.height / 2 - height)
        drawClockFace()
    }
    
    func updateSeconds() {
        let angle = seconds * 6 * CGFloat.pi / 180
        secondsLine.transform = .init(rotationAngle: angle)
    }
    
    func updateSecondsLineFrame(width: CGFloat, height: CGFloat) {
        secondsLine.translatesAutoresizingMaskIntoConstraints = false
        secondsLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        secondsLine.frame = CGRect(x: frame.size.width / 2 - width / 2, y: height, width: width, height: bounds.height / 2 - height)
        drawClockFace()
    }
    
    override func draw(_ rect: CGRect) {
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        updateHourLineFrame(width: hourLineWidth, height: hourLineHeight)
        updateHours()
        
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        updateMinuteLineFrame(width: minuteLineWidth, height: minuteLineHeight)
        updateMinutes()
        
        secondsLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        updateSecondsLineFrame(width: secondsLineWidth, height: secondsLineHeight)
        updateSeconds()
        
        drawClockFace()
    }
    
    func drawClockFace() {
        let w = frame.size.width
        let h = frame.size.height
        
        self.layer.cornerRadius = w / 2
        self.layer.masksToBounds = true
        topMarker.frame = CGRect(x:  w / 2 - markerWidth / 2, y: 0, width: markerWidth, height: markerLenght)
        bottomMarker.frame = CGRect(x: w / 2 - markerWidth / 2, y: h - markerLenght, width: markerWidth, height: markerLenght)
        leftMarker.frame = CGRect(x: 0, y: h / 2, width: markerLenght, height: markerWidth)
        rightMarker.frame = CGRect(x: w - markerLenght, y: h / 2, width: markerLenght, height: markerWidth)
        roundedView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        roundedView.layer.cornerRadius = 8
        roundedView.backgroundColor = roundedViewColor
        for v in [topMarker, bottomMarker, leftMarker, rightMarker] {
            v.backgroundColor = markerColor
        }
        layer.cornerRadius = frame.size.width / 2
        if isSetuped {return}
        isSetuped = true
        
        for v in [topMarker, bottomMarker, leftMarker, rightMarker, minuteLine, hourLine, secondsLine, roundedView] {
            addSubview(v)
        }
    }
}

extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle * CGFloat.pi / 180
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}
