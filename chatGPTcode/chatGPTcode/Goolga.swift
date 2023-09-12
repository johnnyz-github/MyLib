//
//  Goolga.swift
//  chatGPTcode
//
//  Created by Johnny1 on 8/4/2023.
//

import Foundation
import SwiftUI
import CoreData

struct Question {
    var question: String
    var answer: String
    var category: String
    var difficulty: String
}

struct Student: Identifiable {
    let id = UUID()
    var username: String
    var password: String
    var score: Int
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var currentUser: Student?
    @State private var allStudents: [Student] = []
    @State private var questionIndex = 0
    @State private var questions: [Question] = []
    @State private var currentQuestion: Question?
    @State private var userAnswer: String = ""
    @State private var showAnswer = false
    @State private var score: Int = 0
    @State private var passRate: Double = 0.0
    @State private var allPassRate: Double = 0.0
    @State private var difficultyColors: [String: Color] = ["Easy": .green, "Medium": .orange, "Hard": .red]
    @State private var showLogin = true
    
    var body: some View {
        VStack {
            if showLogin {
                LoginView(currentUser: $currentUser, allStudents: $allStudents)
            } else if currentQuestion != nil {
                Text(currentQuestion!.category)
                    .font(.title)
                Text(currentQuestion!.difficulty)
                    .foregroundColor(difficultyColors[currentQuestion!.difficulty])
                    .font(.subheadline)
                Text(currentQuestion!.question)
                    .font(.headline)
                TextField("Answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    checkAnswer()
                }, label: {
                    Text("Submit")
                })
                if showAnswer {
                    Text("Correct answer is: \(currentQuestion!.answer)")
                        .foregroundColor(.red)
                }
            } else {
                Text("No questions available")
            }
            Spacer()
            HStack {
                Text("Score: \(score)")
                Text("Pass rate: \(String(format: "%.0f%%", passRate * 100))")
                Text("All pass rate: \(String(format: "%.0f%%", allPassRate * 100))")
            }
        }
        .padding()
        .onAppear {
            fetchQuestions()
            selectQuestion()
        }
    }
    
    private func fetchQuestions() {
        // Fetch questions from database and populate the questions array
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Question")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Question.category, ascending: true), NSSortDescriptor(keyPath: \Question.difficulty, ascending: true)]
        do {
            let results = try viewContext.fetch(request)
            for question in results as! [Question] {
                questions.append(question)
            }
        } catch {
            print("Error fetching questions: \(error.localizedDescription)")
        }
    }
    
    private func selectQuestion() {
        if questionIndex < questions.count {
            currentQuestion = questions[questionIndex]
        } else {
            currentQuestion = nil
        }
    }
    
    private func checkAnswer() {
        if userAnswer == currentQuestion!.answer {
            score += 1
            passRate = Double(score) / Double(questionIndex + 1)
        } else {
            showAnswer = true
        }
        questionIndex += 1
        selectQuestion()
        updateStudentScore()
        updateAllPassRate()
        userAnswer = ""
        showAnswer = false
    }
