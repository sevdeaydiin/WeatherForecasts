//
//  HomeViewController.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/21/25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupUI()
    }
    
    private func setupUI() {
        let weatherView = WeatherView()
        view.addSubview(weatherView)
        
        weatherView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        let houseView = HouseView()
        view.addSubview(houseView)
        
        houseView.snp.makeConstraints { make in
            make.top.equalTo(weatherView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        let forecastView = ForecastView()
        view.addSubview(forecastView)
        
        forecastView.snp.makeConstraints { make in
            make.top.equalTo(houseView.snp.bottom).offset(-10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
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
    HomeViewController()
}
