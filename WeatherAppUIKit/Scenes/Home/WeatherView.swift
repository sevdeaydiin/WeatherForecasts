//
//  WeatherView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/21/25.
//

import UIKit
import SnapKit

class WeatherView: UIView {
    
    private let cloudIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cloud"))
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19°"
        label.font = UIFont.boldSystemFont(ofSize: 64)
        label.textColor = .black
        return label
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Precipitations\nMax: 24° Min: 18°"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
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
        addSubview(cloudIcon)
        addSubview(temperatureLabel)
        addSubview(detailsLabel)
        
        cloudIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(30)
            make.width.height.equalTo(150)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cloudIcon.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
