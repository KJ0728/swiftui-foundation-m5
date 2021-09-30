//
//  ContentModel.swift
//  LearningApp
//
//  Created by Kun Jong Lee on 2021/09/30.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData:Data?
    
    init() {
        
        getLocalData()
        
    }

    func getLocalData() {

        // get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard jsonUrl != nil else {
            return
        }

        do {
            // read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode the json into an arrray of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
            
        }
        catch {
            print(error)
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        catch {
            print("couldn't parse style data")
        }

    }
    
}
