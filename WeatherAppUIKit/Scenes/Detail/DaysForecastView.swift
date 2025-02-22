//
//  ForecastView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import UIKit
import SnapKit

class DaysForecastView: UIView {
    
    private let days = ["Mon", "Tue", "Wed", "Thu"]
    private let temperatures = ["19°C", "18°C", "18°C", "19°C"]
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
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
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        for i in 0..<days.count {
            let view = createDayView(day: days[i], temperature: temperatures[i])
            stackView.addArrangedSubview(view)
        }
    }
    
    private func createDayView(day: String, temperature: String) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(named: "cloud")
        view.layer.cornerRadius = 40
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        
        let temperatureLabel = UILabel()
        temperatureLabel.text = temperature
        temperatureLabel.font = UIFont.systemFont(ofSize: 20)
        temperatureLabel.textColor = .black
        temperatureLabel.textAlignment = .center
        view.addSubview(temperatureLabel)
        
        let iconImageView = UIImageView(image: UIImage(named: "cloud"))
        iconImageView.contentMode = .scaleAspectFit
        view.addSubview(iconImageView)
        
        let dayLabel = UILabel()
        dayLabel.text = day
        dayLabel.font = UIFont.systemFont(ofSize: 20)
        dayLabel.textColor = .black
        dayLabel.textAlignment = .center
        view.addSubview(dayLabel)

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
   
        return view
    }
}
