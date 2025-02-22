//
//  ForecastView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/21/25.
//

import UIKit
import SnapKit

class ForecastView: UIView {
    
    private let forecastLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "July, 21"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 200
        return stackView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.backgroundColor = .lightSun.withAlphaComponent(0.5)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let hourlyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(backgroundView)
        labelStackView.addArrangedSubview(forecastLabel)
        labelStackView.addArrangedSubview(dateLabel)
        backgroundView.addSubview(labelStackView)
        backgroundView.addSubview(scrollView)
        scrollView.addSubview(hourlyStackView)
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(150)
            make.leading.trailing.bottom.equalToSuperview().inset(-10)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        forecastLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(10)
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }

        hourlyStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(scrollView)
            make.width.equalTo(400)
        }
        
        setupHourlyForecast()
    }
    
    private func setupHourlyForecast() {
        let hours = ["15.00", "16.00", "17.00", "18.00", "19.00", "20.00", "21.00", "22.00"]
        let temperatures = ["19°C", "18°C", "18°C", "18°C", "17°C", "17°C", "16°C", "16°C"]
        let icons = ["cloud", "cloud", "cloud", "cloud", "cloud", "cloud", "cloud", "cloud"]
        
        for i in 0..<8 {
            let view = createHourlView(time: hours[i], temperature: temperatures[i], iconName: icons[i])
            hourlyStackView.addArrangedSubview(view)
        }
    }
    
    private func createHourlView(time: String, temperature: String, iconName: String) -> UIView {
        
        let view = UIView()
        
        let temperatureLabel = UILabel()
        temperatureLabel.text = temperature
        temperatureLabel.font = UIFont.systemFont(ofSize: 14)
        temperatureLabel.textColor = .black
        temperatureLabel.textAlignment = .center
        view.addSubview(temperatureLabel)
        
        let iconImageView = UIImageView(image: UIImage(named: iconName))
        iconImageView.contentMode = .scaleAspectFit
        view.addSubview(iconImageView)
        
        let timeLabel = UILabel()
        timeLabel.text = time
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = .black
        timeLabel.textAlignment = .center
        view.addSubview(timeLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        return view
    }
}
