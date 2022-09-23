//
//  SurveyView.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import SwiftUI
import ServiceHandler

struct SurveyView: View {
    @Environment(\.dismiss) var dismiss
    @State private var typeYourAnswer: String = ""
    @ObservedObject var vm: SurveyViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                let answerEmpty = vm.currentAnswer.isEmpty

                VStack {
                    HStack {
                        ReusableButton(clicked: {
                            vm.previousQuestion()
                            typeYourAnswer = answerEmpty ? vm.currentAnswer : ""
                        }, text: "Previous")

                        Spacer()

                        ReusableButton(clicked: {
                            vm.nextQuestion()
                            typeYourAnswer = answerEmpty ? vm.currentAnswer : ""
                        }, text: "Next")
                    }
                    .padding()

                    Text(vm.currentQuestion)
                        .fontWeight(.regular)
                        .font(.title)
                        .padding()

                    TextField(vm.currentAnswer, text: $typeYourAnswer)
                        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200)
                        .font(.title)
                        .padding()
                        .disabled(!answerEmpty)
                        .background(.gray)

                    let buttonTitle = answerEmpty ? "Submit" : (vm.errorMessage == nil ? "Already Submitted" : "Retry")
                    ReusableButton(clicked: {
                        Task {
                            await vm.submit(answer: typeYourAnswer)
                        }
                    }, text: buttonTitle, visibility: buttonTitle == "Already Submitted" ? true : false)

                    Spacer()

                    Text(vm.errorMessage == nil ? "Success" : "Failure")
                    Text("Questions submitted : \(vm.totalSubmission)")

                    HStack() {
                        Spacer()
                        ReusableButton(clicked: {
                            handleDismiss()
                        }, text: "Close Survey")
                    }
                    .padding()
                }
            }
            .navigationTitle("Questions \(vm.index + 1)" + "/" + "\(vm.surveys?.count ?? 0)")
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            Task {
                await vm.fetchSurveyQuestions()
            }
        }
    }
}

private extension SurveyView {
    func handleDismiss() {
        dismiss()
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView(vm: SurveyViewModel(service: SurveyService(service: NetworkService())))
    }
}
