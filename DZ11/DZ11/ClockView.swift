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
    let markerColor = UIColor.orange
    
    @IBInspectable var hours: CGFloat = 7 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var minutes: CGFloat = 15 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var seconds: CGFloat = 35 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    private let topMarker = UIView()
    private let bottomMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    
    private let hourLine = UIView()
    private var hourLineSize: CGFloat = 4
    
    private var minuteLine = UIView()
    private var minuteLineSize: CGFloat = 4
    private var minuteLineOffset: CGFloat = 40
    
    private var secondLine = UIView()
    private var secondLineSize: CGFloat = 3
    private var secondLineOffset: CGFloat = 20
    
    let w = 100
    let h = 200
    
    @IBInspectable private var height: CGFloat = 50 {
        didSet {
            
        }
    }
    private var hourLineOffset: CGFloat = 20 
    @IBInspectable private var hourLineColor: UIColor = UIColor.blue {
        didSet {
            hourLine.backgroundColor = hourLineColor
        }
    }
    @IBInspectable private var minuteLineColor: UIColor = UIColor.green {
        didSet {
            minuteLine.backgroundColor = minuteLineColor
        }
    }
    @IBInspectable private var secondLineColor: UIColor = UIColor.yellow {
        didSet {
            secondLine.backgroundColor = secondLineColor
        }
    }
    
    private let roundedView = UIView()
    @IBInspectable private var roundedViewColor: UIColor = UIColor.blue {
        didSet{
            roundedView.backgroundColor = roundedViewColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = frame.size.width
        let h = frame.size.height
        
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineOffset, width: hourLineSize, height: h / 2 - hourLineOffset)
        hourLine.backgroundColor = hourLineColor
        //updateHourLineFrame()
        updateHours()
        
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: minuteLineOffset, width: minuteLineSize, height: h / 2 - minuteLineOffset)
        minuteLine.backgroundColor = minuteLineColor
        //updateHourLineFrame()
        updateMinutes()
        
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2, y: secondLineOffset, width: secondLineSize, height: h / 2 - secondLineOffset)
        secondLine.backgroundColor = secondLineColor
        //updateHourLineFrame()
        updateSeconds()
        
        
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
        
        for v in [topMarker, bottomMarker, leftMarker, rightMarker, hourLine, minuteLine, secondLine, roundedView] {
            addSubview(v)
        }
    }
    
//    func updateHourLineFrame() {
//        let w = frame.size.width
//        let h = frame.size.height
//        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineOffset, width: hourLineSize, height: h / 2 - hourLineOffset)
//    }
    func updateHours() {
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    func updateMinutes() {
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    func updateSeconds() {
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
    }

}
