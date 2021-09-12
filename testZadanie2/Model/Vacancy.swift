//
//  Vacancy.swift
//  testZadanie2
//
//  Created by Andrey on 11.09.2021.
//

import Foundation

struct Vacancy: Codable {
    let items: [Items?]
}

struct Items: Codable {
    let name: String?
    let salary: Salary?
    let address: Address?
}

struct Salary: Codable {
    let from: Int?
    let to: Int?
}

struct Address: Codable {
    let city: String?
}

enum CodingKeys: String, CodingKey {
    case name = "name"
    case salary = "salary"
    case address = "address"
    case from = "from"
    case to = "to"
    case city = "city"
}
