//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Kun Jong Lee on 2021/09/30.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index:Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        // Lesson card
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 60)
            
            HStack(spacing: 30) {
                
                Text(String(index + 1))
                    .bold()
                VStack (alignment: .leading) {
                    Text(lesson.title)
                    Text(lesson.duration)
                }
            }
            .padding()
        }
        .padding(.bottom, 1)
    }
}

//struct ContentViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewRow()
//    }
//}
