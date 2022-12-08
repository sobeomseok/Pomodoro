//
//  TimerController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/10/19.
//

import UIKit

enum TimerState {
    case resumed
    case paused
    case stopped
    case finished
}

final class HomeController: UIViewController {
    
    // MARK: - Properties
    private var timer = Timer()
    
    private var timerState = TimerState.stopped
    
    private let runtimes = [15, 25, 30, 50]
    private var runtime: Int = 1500
    private var downtime: Int = 5
    private var times: Int = 5
    
    private var selectedRuntime: Int = 1500
    private var selectedDowntime: Int = 5
    private var selectedTimes: Int = 5
    
    private let topImageContainer = UIView()
    
    private var animatedCountingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 55)
        label.textColor = .darkGray
        label.text = "25:00"
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
    
    private lazy var resumeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 60), forImageIn: .normal)
        button.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 60), forImageIn: .normal)
        button.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 55), forImageIn: .normal)
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Label
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
    
    // UIPickerView
    private lazy var timePicker: UIPickerView = {
      let pickerView = UIPickerView()
      pickerView.delegate = self
      pickerView.dataSource = self
      return pickerView
    }()
    
    // Stack View
    private lazy var HStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [runTimeLabel, downTimeLabel, timesLabel])
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var ButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [playButton, resumeButton, pauseButton, stopButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUI()
        configure()
        setUpCircularProgressBarView()
    }
    
    // MARK: - Selectors
    @objc func playButtonTapped() {
        resume()
        startTimer()
    }
    
    @objc func resumeButtonTapped() {
        resume()
        startTimer()
    }
    
    @objc func pauseButtonTapped() {
        pause()
    }
    
    @objc func stopButtonTapped() {
        stop()
    }
    
    @objc func updateTimer() {
            if runtime > 0 {
                runtime -= 1
                animatedCountingLabel.text = formatTime(setTime: runtime)
            } else {
                if downtime > 0 {
                    animatedCountingLabel.text = formatTime(setTime: downtime)
                    downtime -= 1
                } else {
                    if times > 0 {
                        animatedCountingLabel.text = formatTime(setTime: downtime)
                        times -= 1
                        runtime = selectedRuntime + 1 // delay 1 second
                        downtime = selectedDowntime
                    } else {
                        timer.invalidate()
                        stop()
                    }
                }
            }
    }
    
    // MARK: - Helpers
    private func configureUI() {
        view.addSubview(topImageContainer)
        topImageContainer.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor)
        topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.addSubview(animatedCountingLabel)
        animatedCountingLabel.anchor(width: 200, height: 100)
        animatedCountingLabel.centerX(inView: topImageContainer)
        animatedCountingLabel.centerY(inView: topImageContainer)
        
        view.addSubview(ButtonStackView)
        ButtonStackView.backgroundColor = .yellow
        ButtonStackView.anchor(top: topImageContainer.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor,
                               paddingTop: 0, paddingLeft: 0, paddingRight: 0, height: 60)
        ButtonStackView.addArrangedSubviews(playButton)
        
        view.addSubview(HStackView)
        HStackView.anchor(top: ButtonStackView.bottomAnchor, paddingTop: 60, width: timePicker.frame.width)
        HStackView.centerX(inView: view)
        
        view.addSubview(timePicker)
        timePicker.anchor(top: HStackView.bottomAnchor)
        timePicker.centerX(inView: view)
    }
    
    // Start Timer
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    private func configure() {
        // TimePicker Setting
        timePicker.selectRow(1, inComponent: 0, animated: true)
        timePicker.selectRow(4, inComponent: 1, animated: true)
        timePicker.selectRow(4, inComponent: 2, animated: true)
        
        // Set ButtonStackView
        timerState = .stopped
        setTimerButtonsUsingTimerState()
        
        initTimer()
    }
    
    private func setUpCircularProgressBarView() {
        
    }
    
    // Set Pomodoro State
    private func resume() {
        timerState = .resumed
        setTimerButtonsUsingTimerState()
    }
    
    private func pause() {
        timer.invalidate()
        timerState = .paused
        setTimerButtonsUsingTimerState()
    }
    
    private func stop() {
        timer.invalidate()
        timerState = .stopped
        setTimerButtonsUsingTimerState()
        initTimer()
    }
    
    // Initailize Timer
    private func initTimer() {
        runtime = selectedRuntime
        downtime = selectedDowntime
        times = selectedTimes
        animatedCountingLabel.text = formatTime(setTime: runtime)
    }
    
    // Format Time
    private func formatTime(setTime: Int) -> String {
        let minutes = setTime / 60
        let seconds = setTime % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    // Set Timer Button
    private func setTimerButtonsUsingTimerState() {
        switch timerState {
        case .resumed:
            playButton.isHidden = true
            resumeButton.isHidden = true
            pauseButton.isHidden = false
            stopButton.isHidden = true
        case .paused:
            playButton.isHidden = true
            resumeButton.isHidden = false
            pauseButton.isHidden = true
            stopButton.isHidden = false
        case .stopped:
            playButton.isHidden = false
            resumeButton.isHidden = true
            pauseButton.isHidden = true
            stopButton.isHidden = true
        case .finished: break
        }
    }
}

// MARK: - UIPickerViewDelegate & UIPickerViewDataSource
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
            runtime = runtimes[row] * 60
            selectedRuntime = runtime
            animatedCountingLabel.text = formatTime(setTime: runtime)
        case 1:
            downtime = (row + 1) * 60
            selectedDowntime = downtime
        case 2:
            times = (row + 1)
            selectedTimes = times
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
