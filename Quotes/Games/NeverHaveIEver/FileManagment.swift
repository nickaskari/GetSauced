//
//  FileManagment.swift
//  Quotes
//
//  Created by Nick Askari on 07/07/2021.
//

import Foundation

class FileManagment {
    
    var directoryURL: URL {
        let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url!
    }
    
    func fileURL(fileName: String, fileExtension: String) -> URL {
        let url =
            directoryURL.appendingPathComponent(fileName)
            .appendingPathExtension(fileExtension)
        return url
    }
    
    func writeFile(writeString: String, to fileName: String, fileExtension: String = "txt") {
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        
        do {
            try writeString.write(to: url, atomically: true, encoding: .utf8)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func readFile(from fileName: String, fileExtension: String = "txt") -> String {
        var result = ""
         
        //if you get access to the directory
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
         
            //prepare file url
            let fileURL = dir.appendingPathComponent(fileName)
            print("This is the path: \(fileURL)")
         
            do {
                result = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* handle if there are any errors */}
        }
         
        return result
    }
}
