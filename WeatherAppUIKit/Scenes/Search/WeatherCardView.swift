//
//  WeatherCardView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import UIKit
import SnapKit

class WeatherCardView: UIView {
    
    private let localionLabel: UILabel = {
        let label = UILabel()
        label.text = "Konya"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Çok bulutlu"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "-4°"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textColor = .black
        return label
    }()
    
    private let minMaxLabel: UILabel = {
        let label = UILabel()
        label.text = "D:-10° Y:-4°"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let houseIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "house.fill"))
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "cloud")
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(localionLabel)
        addSubview(conditionLabel)
        addSubview(temperatureLabel)
        addSubview(minMaxLabel)
        addSubview(houseIcon)
        
        localionLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
        }
        
        conditionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(15)
        }
        
        minMaxLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().inset(20)
        }
        
        houseIcon.snp.makeConstraints { make in
            make.leading.equalTo(localionLabel.snp.trailing).offset(5)
            make.centerY.equalTo(localionLabel)
        }
    }
}
