//
//  Doctor.swift
//  MedicalTestApp
//
//  Created by Muhammad Bassiouny on 04/03/1446 AH.
//

import Foundation

struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let imageurl: String
    let title: String
    let rating: Double
    let numberOfReviews: Int
    let about: String
    let workingTime: String
    let str: String
    let details1: String
    let details2: String
    let reviews: [Review]
}

struct Review: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let rating: Int
    let content: String
}

let doctor = Doctor(
    name: "Dr. Randy Wigham",
    imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH8EPl9l4DGlpG72PLVF8OSWVM3zhvXxk1Iw&s",
    title: "General | RSUD Gatot Subroto",
    rating: 4.8,
    numberOfReviews: 4279,
    about: "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
    workingTime: "Monday - Friday, 08.00 AM - 20.00 PM",
    str: "4726482464",
    details1: "RSPAD Gatot Soebroto",
    details2: "2017 - sekarang",
    reviews: reviews
)

let reviews: [Review] = [
    Review(name: "Ali Tarek", image: "person.circle.fill", rating: 4, content: "Good doctor and good listener"),
    Review(name: "Khaled Ahmed", image: "person.circle.fill", rating: 5, content: "The doctor is patient and give a details explaination of the case.")
]
