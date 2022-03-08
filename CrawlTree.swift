//
//  CrawlTree.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-07.
//

import Foundation

let manager = FileManager.default
let currentPath = manager.currentDirectoryPath
  
func getCrawl(_ path: String, _ soFar: String = "" ) {
  let currentUrl = try? manager.contentsOfDirectory(at: URL(fileURLWithPath: path), includingPropertiesForKeys: [], options: .skipsHiddenFiles)

  // currentUrl is not nill
  // base case
  if currentUrl == nil {
    return
  } else {
//    print(currentUrl)
    for url in currentUrl! {
      var isFolder: ObjCBool = false
      var branch = url == currentUrl?.last ? "└─" : "├─"
      var line = url == currentUrl?.last ? "  " : "│ "
      print(soFar + branch, manager.displayName(atPath: url.path))
      if manager.fileExists(atPath: currentPath, isDirectory: &isFolder) {
        getCrawl(url.path, soFar + line + "  ")
    }
  }
}
  

}
