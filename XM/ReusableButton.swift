//
//  ReusableButton.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import SwiftUI

struct ReusableButton: View {
    var clicked: (() -> Void)
    var text: String
    var visibility: Bool = false

    var body: some View {
        Button(text, action: clicked)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.black, lineWidth: 2)
            }
            .frame(minWidth: 100, maxWidth: 200)
            .foregroundColor(.black)
            .disabled(visibility)
    }
}

struct ReusableButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableButton(clicked: {}, text: "Close Survey")
    }
}
