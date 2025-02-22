//
//  InfoView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import UIKit
import SnapKit

class InfoView: UIView {
    
    private let sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "5:28 AM"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset: 7:25 PM"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let uvIndexLabel: UILabel = {
        let label = UILabel()
        label.text = "4 Moderate"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let sunriseView = UIView()
        sunriseView.backgroundColor = UIColor(named: "cloud")
        sunriseView.layer.cornerRadius = 10
        sunriseView.clipsToBounds = true
        sunriseView.layer.borderWidth = 2
        sunriseView.layer.borderColor = UIColor.black.cgColor
        addSubview(sunriseView)
        
        let uvIndexView = UIView()
        uvIndexView.backgroundColor = UIColor(named: "cloud")
        uvIndexView.layer.cornerRadius = 10
        uvIndexView.clipsToBounds = true
        uvIndexView.layer.borderWidth = 2
        uvIndexView.layer.borderColor = UIColor.black.cgColor
        addSubview(uvIndexView)
        
        sunriseView.addSubview(sunriseLabel)
        sunriseView.addSubview(sunsetLabel)
        
        uvIndexView.addSubview(uvIndexLabel)
        
        sunriseView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(uvIndexView.snp.leading).offset(-10)
            make.width.equalTo(uvIndexView)
        }
        
        uvIndexView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
        }
        
        sunriseLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
        }
        
        sunsetLabel.snp.makeConstraints { make in
            make.top.equalTo(sunriseLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        uvIndexLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
