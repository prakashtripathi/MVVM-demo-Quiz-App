//
//  QuizModel.swift
//  MVVM Api Integration App
//
//  Created by Prakash Tripathi on 24/03/23.
//

// MARK: - QuizModel
struct QuizModel: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let correctAnswer, option1, option2, option3: String
    let option4, question: String

    enum CodingKeys: String, CodingKey {
        case correctAnswer = "correct_answer"
        case option1 = "option_1"
        case option2 = "option_2"
        case option3 = "option_3"
        case option4 = "option_4"
        case question
    }
}
