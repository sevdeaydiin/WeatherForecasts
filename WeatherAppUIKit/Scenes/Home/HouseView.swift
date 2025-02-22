//
//  HouseView.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/21/25.
//

import UIKit
import SnapKit

class HouseView: UIView {
    
    private let houseIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "house"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(houseIcon)
        
        houseIcon.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }
}
