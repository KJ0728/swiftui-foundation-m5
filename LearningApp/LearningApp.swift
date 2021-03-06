//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Kun Jong Lee on 2021/09/29.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
