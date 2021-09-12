//
//  VacancyCell.swift
//  testZadanie2
//
//  Created by Andrey on 12.09.2021.
//

import UIKit

class VacancyCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var salaryLabel = UILabel()
    var cityLabel = UILabel()
    
    let stackView   = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLabels()
        setStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(vacancies: Items) {
        nameLabel.text = "Вакансия: \(vacancies.name ?? "Не указана")"
        
        if vacancies.salary?.from != nil && vacancies.salary?.to != nil {
            salaryLabel.text = "Зарплата От: \(vacancies.salary?.from ?? 0) до: \(vacancies.salary?.to ?? 0) т.р."
        } else if vacancies.salary?.from != nil && vacancies.salary?.to == nil {
            salaryLabel.text = "Зарплата: \(vacancies.salary?.from ?? 0) т.р."
        } else if vacancies.salary?.from == nil && vacancies.salary?.to != nil{
            salaryLabel.text = "Зарплата: \(vacancies.salary?.to ?? 0) т.р."
        } else {
            salaryLabel.text = "Зарплата: Не указана"
        }
        
        cityLabel.text = "Город: \(vacancies.address?.city ?? "Не указан")"
    }
    
    func configureLabels() {
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor = UIColor.red

        salaryLabel.numberOfLines = 0
        salaryLabel.font = UIFont.systemFont(ofSize: 20)

        cityLabel.numberOfLines = 0
        cityLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    func setStackView() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        
        //Constraints
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(salaryLabel)
        stackView.addArrangedSubview(cityLabel)
    }
}
