//
//  ContentView.swift
//  LearningApp
//
//  Created by Kun Jong Lee on 2021/09/30.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject  var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    
                    ForEach (0..<model.currentModule!.content.lessons.count) { index in
                        
                        ContentViewRow(index: index)
                    }
                }
            }
            .padding()
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environmentObject(ContentModel())
//    }
//}
