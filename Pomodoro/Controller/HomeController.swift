//
//  TimerController.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/10/19.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private var TimePicker = UIPickerView()
    
    let Times = ["15분", "25분", "30분", "50분"]
    var duration: Int = 60
    var timerStatus: TimerStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 0
    var progressBar: UIProgressView!
    
    let circularProgressBarView = CircularProgressBarView()
    var circularViewDuration: TimeInterval = 2
    
    let topImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let animatedCountingLabel: UILabel = {
        let label = UILabel()
//        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 55)
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        TimePicker.delegate = self
        TimePicker.dataSource = self
        
        configureUI()
        setUpCircularProgressBarView()
    }
    
    
    // MARK: - Selectors
    
    @objc func playButtonTapped() {
        print("play Button Tapped")
    }
    
    // MARK: - API
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(topImageContainer)
        topImageContainer.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor)
        topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.addSubview(circularProgressBarView)
        circularProgressBarView.progressColor = .red
        circularProgressBarView.trackColor = .lightGray
        circularProgressBarView.anchor(width: 300, height: 300)
        circularProgressBarView.centerX(inView: topImageContainer)
        circularProgressBarView.centerY(inView: topImageContainer)
         
        view.addSubview(playButton)
        playButton.anchor()
        playButton.centerX(inView: view)
        playButton.centerY(inView: view)
        
        
        view.addSubview(TimePicker)
        TimePicker.selectRow(1, inComponent: 0, animated: true)
        TimePicker.anchor(top: playButton.bottomAnchor, paddingTop: 30)
        TimePicker.centerX(inView: view)
        
//        circularProgressBarView.center = topImageContainerView.convert(topImageContainerView.center, from: view)
//        circularProgressBarView.center = CGPoint(x: topImageContainerView.bounds.size.width/2, y: topImageContainerView.bounds.size.height/2)
        
        view.addSubview(animatedCountingLabel)
        animatedCountingLabel.anchor(width: 200, height: 100)
        animatedCountingLabel.centerX(inView: topImageContainer)
        animatedCountingLabel.centerY(inView: topImageContainer)
        
        circularProgressBarView.progress = 1
    }
    
    func setUpCircularProgressBarView() {
        
    }
}

extension HomeController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Times[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var title = UILabel()
        if let view = view { title = view as! UILabel }
        title.font = UIFont.systemFont(ofSize: 25)
        title.textColor = UIColor.gray
        title.text =  Times[row]
        title.textAlignment = .center
        return title
    }
}
