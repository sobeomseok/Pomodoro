//
//  CircularProgressBarView.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/08.
//

import UIKit

class CircularTimerView: UIView {
    
    private let progressColors: ProgressColors
    
    private lazy var circularPath: UIBezierPath = {
        return UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                            radius: 100,
                            startAngle: -90.degreesToRadians,
                            endAngle: CGFloat.pi * 2,
                            clockwise: true)
    }()
    
    private lazy var trackLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = progressColors.trackLayerStrokeColor
        layer.lineWidth = 15
        return layer
    }()
    
    private lazy var barLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = progressColors.barLayerStrokeColor
        layer.lineWidth = 15
        return layer
    }()

    init(progressColors: ProgressColors) {
        self.progressColors = progressColors
        
        super.init(frame: .zero)
        
        addSubviews()
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        layer.addSublayer(trackLayer)
        layer.addSublayer(barLayer)
    }
    
    private func setupViews() {
        animateToBarLayer()
    }
    
    private func animateToBarLayer() {
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0
        strokeAnimation.toValue = 1
        
        barLayer.add(strokeAnimation, forKey: nil)

    }
}
