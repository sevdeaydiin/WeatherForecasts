//
//  AirConditionView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import UIKit
import SnapKit

class AirConditionView: UIView {
    
    private let airConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "3-Low Health Risk"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let seeMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "See more"
        label.font = UIFont.systemFont(ofSize: 14)
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
        backgroundColor = UIColor(named: "cloud")
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        addSubview(airConditionLabel)
        addSubview(seeMoreLabel)
        
        airConditionLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
        }
        
        seeMoreLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().offset(-10)
        }
    }
}
