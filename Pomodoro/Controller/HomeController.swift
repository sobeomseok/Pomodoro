//
//  TimerController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/10/19.
//

import UIKit

final class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private var timePicker = UIPickerView()
    
    private var timer = Timer()
    
    private let runtimes = [15, 25, 30, 50]
    
    var runtime: Int = 0
    var downtime: Int = 0
    var time: Int = 0
    
    private lazy var duration: Int = 60
    private lazy var timerStatus: TimerStatus = .end
//    private var timer: DispatchSourceTimer?
    private lazy var currentSeconds = 0
    private var progressBar: UIProgressView!
    
    private let circularProgressBarView = CircularProgressBarView()
    private lazy var circularViewDuration: TimeInterval = 2
    
    private let topImageContainer = UIView()
    
    private var animatedCountingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 55)
        label.textColor = .darkGray
        label.text = "00:00"
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    // Button
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 60), forImageIn: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let runTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .gray
        label.text = "집중"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let downTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .gray
        label.text = "휴식"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let timesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .gray
        label.text = "반복"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    // Stack View
    private lazy var HStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [runTimeLabel, downTimeLabel, timesLabel])
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        configureUI()
        configure()
        setUpCircularProgressBarView()
    }
    
    deinit {
        timer.invalidate()
    }
    // MARK: - Selectors
    
    @objc func playButtonTapped() {
        print("play Button Tapped")
        setTimer(with: timePicker.selectedRow(inComponent: 0))
    }
    
    // MARK: - API
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.addSubview(topImageContainer)
        topImageContainer.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor)
        topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.addSubview(circularProgressBarView)
        circularProgressBarView.progressColor = .red
        circularProgressBarView.trackColor = .lightGray
        circularProgressBarView.progress = 1
        circularProgressBarView.anchor(width: 300, height: 300)
        circularProgressBarView.centerX(inView: topImageContainer)
        circularProgressBarView.centerY(inView: topImageContainer)
        
        topImageContainer.addSubview(animatedCountingLabel)
        animatedCountingLabel.anchor(width: 200, height: 100)
        animatedCountingLabel.centerX(inView: topImageContainer)
        animatedCountingLabel.centerY(inView: topImageContainer)
         
        view.addSubview(playButton)
        playButton.anchor(top: circularProgressBarView.bottomAnchor)
        playButton.centerX(inView: view)
        
        view.addSubview(HStackView)
        HStackView.anchor(top: playButton.bottomAnchor, paddingTop: 80, width: timePicker.frame.width)
        HStackView.centerX(inView: view)
        
        view.addSubview(timePicker)
        timePicker.selectRow(1, inComponent: 0, animated: true)
        timePicker.selectRow(4, inComponent: 1, animated: true)
        timePicker.selectRow(4, inComponent: 2, animated: true)
        timePicker.anchor(top: HStackView.bottomAnchor)
        timePicker.centerX(inView: view)
        
//        circularProgressBarView.center = topImageContainerView.convert(topImageContainerView.center, from: view)
//        circularProgressBarView.center = CGPoint(x: topImageContainerView.bounds.size.width/2, y: topImageContainerView.bounds.size.height/2)
        
        
    }
    
    private func configure() {
        
    }
    
    private func setUpCircularProgressBarView() {
        
    }
    
    // Set Timer function
    private func setTimer(with countDownSeconds: Int) {
        let startTime = Date()
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
            let elapsedTimeSeconds = Int(Date().timeIntervalSince(startTime))
            let remainSeconds = Int(countDownSeconds) - elapsedTimeSeconds
            guard remainSeconds >= 0 else {
                timer.invalidate()
                return
            }
            
            self?.animatedCountingLabel.text = "\(remainSeconds)"
        })
        
    }
    
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension HomeController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return runtimes.count
        case 1:
            return 15
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(runtimes[row]) 분"
        case 1:
            return "\(row + 1) 분"
        case 2:
            return "\(row + 1) 회"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            runtime = row
            animatedCountingLabel.text = String(runtimes[row])
        case 1:
            downtime = row
        case 2:
            time = row
        default:
            break
        }
    }
    
    // PickerView Layout
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width / 3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}
