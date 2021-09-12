//
//  ViewController.swift
//  testZadanie2
//
//  Created by Andrey on 11.09.2021.
//

import UIKit

class VacancyController: UIViewController {
    
    var tableView = UITableView()
    
    let service = Service()
    
    var vacancies = [Items?]()
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вакансии на HH.ru"
        configureTableView()
        
        service.parse { data in
            
            self.vacancies = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    func configureTableView() {
        view.addSubview(tableView)
        //Set delegates
        setTableViewDelegates()
        //row height
        tableView.rowHeight = 300
        //register cell
        tableView.register(VacancyCell.self, forCellReuseIdentifier: "VacancyCell")
        //set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension VacancyController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancies.count
//        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyCell") as! VacancyCell
        let vacancy = vacancies[indexPath.row]
        
        cell.set(vacancies: vacancy!)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offSetY > contentHeight - scrollView.frame.height) && !isLoading {
            loadMoreData()
        }
    }
    
    func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                sleep(2)
                
                self.service.parse { (data) in
                    self.vacancies.append(contentsOf: data)
                }
                
                DispatchQueue.main.async {
                    print("Количество вакансий: \(self.vacancies.count)")
                    self.tableView.reloadData()
                    self.isLoading = false
                }
            }
        }
    }
    
}
