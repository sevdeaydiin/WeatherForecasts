//
//  OnboardingView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/21/25.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupUI()
    }
    
    private func setupUI() {

        let cloudIcon = UIImageView(image: UIImage(named: "cloud"))
        view.addSubview(cloudIcon)
        
        cloudIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
            make.width.height.equalTo(250)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "Weather"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 64)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(cloudIcon.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "ForeCasts"
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        subtitleLabel.textColor = UIColor.black
        view.addSubview(subtitleLabel)
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        let getStartButton = UIButton()
        getStartButton.setTitle("Get Start", for: .normal)
        getStartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        getStartButton.backgroundColor = UIColor(named: "sun")
        getStartButton.setTitleColor(.black, for: .normal)
        getStartButton.layer.cornerRadius = 30
        getStartButton.addTarget(self, action: #selector(getStartButtonTapped), for: .touchUpInside)
        view.addSubview(getStartButton)
        
        getStartButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
    }
    
    @objc private func getStartButtonTapped() {
        UserDefaultsManager.shared.isFirstLaunch = false
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateInitialViewController() {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = mainVC
                UIView.transition(with: window,
                                duration: 0.3,
                                options: .transitionCrossDissolve,
                                animations: nil,
                                completion: nil)
            }
        }
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(named: "lightSun")?.cgColor ?? UIColor.blue.cgColor,
            UIColor(named: "lightCloud")?.cgColor ?? UIColor.purple.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

#Preview {
    OnboardingViewController()
}
