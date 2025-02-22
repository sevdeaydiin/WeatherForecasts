//
//  DetailViewController.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/21/25.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let headerView = HeaderView()
    let daysForecast = DaysForecastView()
    let airConditionView = AirConditionView()
    let infoView = InfoView()
    let forecastLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(headerView)
        view.addSubview(forecastLabel)
        view.addSubview(daysForecast)
        view.addSubview(airConditionView)
        view.addSubview(infoView)
        
        forecastLabel.text = "7-Days Forecast"
        forecastLabel.font = UIFont.boldSystemFont(ofSize: 24)
        forecastLabel.textColor = .black
    }
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        forecastLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        
        daysForecast.snp.makeConstraints { make in
            make.top.equalTo(forecastLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(160)
        }
        
        airConditionView.snp.makeConstraints { make in
            make.top.equalTo(daysForecast.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(airConditionView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(150)
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
    DetailViewController()
}
