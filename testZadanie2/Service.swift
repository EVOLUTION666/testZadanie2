//
//  Service.swift
//  testZadanie2
//
//  Created by Andrey on 12.09.2021.
//

import Foundation

struct Service {
    func parse(completionHandler: @escaping ([Items?])->()) {
        let url = URL(string: "https://api.hh.ru/vacancies")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            do {
               let result = try JSONDecoder().decode(Vacancy.self, from: data!)
                completionHandler(result.items)
            } catch {
                
            }
        }.resume()
    }
}

