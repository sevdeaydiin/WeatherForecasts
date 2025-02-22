//
//  SearchViewController.swift
//  WeatherAppUIKit
//
//  Created by Sevde Aydın on 2/22/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    let titleLabel = UILabel()
    let searchBar = UISearchBar()
    let weatherCard = WeatherCardView()
    let favoritesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        titleLabel.text = "Hava Durumu"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        searchBar.placeholder = "Şehir arayın"
        searchBar.searchBarStyle = .minimal
        view.addSubview(searchBar)

        view.addSubview(weatherCard)
        
        favoritesTableView.backgroundColor = .clear
        view.addSubview(favoritesTableView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        weatherCard.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(120)
        }
        
        favoritesTableView.snp.makeConstraints { make in
            make.top.equalTo(weatherCard.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
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
    SearchViewController()
}
