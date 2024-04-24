//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 24.04.2024.
//

import SwiftUI

struct ButtonView: View {
    let color: Color
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .bold()
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 4))
    }
}

#Preview {
    ButtonView(color: .red, title: "Start", action: {})
}
