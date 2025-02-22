//
//  HeaderView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "North America"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "Max: 24°  Min: 18°"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
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
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        
        locationLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
