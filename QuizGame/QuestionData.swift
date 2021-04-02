//
//  QuestionData.swift
//  QuizGame
//
//  Created by A.M. Class on 3/25/21.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

enum ResponseType {
    case question1, question2, question3
}

struct Answer{
    var text: String
    var type: CharacterType
}

enum CharacterType: String {
    case Jotaro = "Jotaro", Polnareff = "Polnareff", Avdol = "Avdol", Joseph = "Joseph"

var definition: String {
    switch self {
    case .Jotaro:
        return "You can be very cold but at the same time you can be caring. YARE YARE DAZE!"
    case .Polnareff:
        return "You are super outgoing, fun and a neat freak. You really dont think things through but you always have good intentions "
    case .Avdol:
        return "You are mature and a mentor. You have themost common sense of everyone and are pretty self rightous. You defiently care about how are you are preceived"
    case .Joseph:
        return "You're very wise, you are the person that people come to for advise when times get hard. Your experiences through life are what helps people you are around"
        }
    }
}
