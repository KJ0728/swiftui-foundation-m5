//
//  ContentModel.swift
//  LearningApp
//
//  Created by Kun Jong Lee on 2021/09/30.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData:Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: - Data methods

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
    
    // MARK: - Module navigation methods
    
    func beginModule(_ moduleId: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
}
