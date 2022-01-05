//
//  APButton.swift
//  Apple-Frameworks
//
//  Created by Hassan Sohail Dar on 4/1/22.
//

import SwiftUI

struct APButton: View {
    var title: String
    var body: some View {
        
        
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title")
    }
}
