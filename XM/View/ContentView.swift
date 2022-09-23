//
//  ContentView.swift
//  XM
//
//  Created by Norman, ThankaVijay on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    let viewModelFactory: ViewModelFactory = ViewModelFactory()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)

                NavigationLink(destination: SurveyView(vm: viewModelFactory.surveyViewModel())) {
                    Text("Start survey")
                        .font(.system(size: 18))
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
            }
            .navigationTitle("Welcome")
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
