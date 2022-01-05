//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Hassan Sohail Dar on 5/1/22.
//

import SwiftUI

//if inheritance isnt going to be implemented use final at start of class

final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailsView = true
        }
        
    }
    
    
    @Published var isShowingDetailsView = false
    
}
