//
//  webContentModel.swift
//  rBrowser
//
//  Created by Paweł Kłosowicz on 19/05/16.
//  Copyright © 2016 Paweł Kłosowicz. All rights reserved.
//

import Foundation
import HTMLReader

class WebContentModel{
    
    func getUrlContent(url: NSURL) -> String {
            do {
                let myHTMLString = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                return myHTMLString
            } catch {
                print("Error : \(error)")
            }
        return ""
    }
    
    func revString(word: String) -> String {
        var returnArray = [String]()
        //dzieli na slowa
        let wordArray = word.componentsSeparatedByString(" ")
        //obraca kazde slowo
        for singleWord in wordArray {
            returnArray.append(String(singleWord.characters.reverse()))
        }
        //scala ponownie do stringa
        return returnArray.joinWithSeparator(" ")
    }
    
    func returnReversedTextWebsite(url: NSURL) -> String{
        //pobiera url jako string
        let html = getUrlContent(url)
        //instancja parsera z zawartoscia urla
        let doc = HTMLDocument(string: html)
        //recursywnie porusza sie w dol drzewa zrobionego z HTMLNode i wywoluje odwracanie calego teskstu
        recurringNodeExplore(doc.rootElement!)
        //zwaraca string
        return doc.serializedFragment
    }
    
    func recurringNodeExplore(mutableNodes : HTMLNode){
        for nodeNumber in 0..<mutableNodes.numberOfChildren{
            if mutableNodes.childAtIndex(nodeNumber).numberOfChildren == 0{
                let str = mutableNodes.childAtIndex(nodeNumber).textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                if(!str.isEmpty){
                    print(mutableNodes.childAtIndex(nodeNumber).textContent)
                    
                    mutableNodes.editString(revString(mutableNodes.childAtIndex(nodeNumber).textContent), atChildNodeIndex: nodeNumber)
                    
                    print(mutableNodes.childAtIndex(nodeNumber).textContent)
                }
            } else {
                for childNodeNumber in 0..<mutableNodes.childAtIndex(nodeNumber).numberOfChildren{
                    recurringNodeExplore(mutableNodes.childAtIndex(nodeNumber).childAtIndex(childNodeNumber))
                }
            }
        }
    }
}