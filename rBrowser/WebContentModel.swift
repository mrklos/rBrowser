//
//  webContentModel.swift
//  rBrowser
//
//  Created by Paweł Kłosowicz on 19/05/16.
//  Copyright © 2016 Paweł Kłosowicz. All rights reserved.
//

import Foundation
import HTMLReader

class WebContentModel {
    
    func getUrlContent(url: NSURL) -> String? {
            do {
                let myHTMLString = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                return myHTMLString
            } catch {
                print("Error : \(error)")
            }
        return nil
    }
    
    /// Function for reverting given text
    func revString(word: String) -> String {
        var arr = [String]()
        //dzieli na slowa
        let wordArray = word.componentsSeparatedByString(" ")
        //obraca kazde slowo
        for singleWord in wordArray {
            arr.append(String(singleWord.characters.reverse()))
        }
        //scala ponownie do stringa
        return arr.joinWithSeparator(" ")
    }
    
    func getReversedTextWebsite(url: NSURL) -> String? {
        //pobiera url jako string
        if let html = getUrlContent(url) {
            //instancja parsera z zawartoscia urla
            let doc = HTMLDocument(string: html)
            //recursywnie porusza sie w dol drzewa zrobionego z HTMLNode i wywoluje odwracanie calego teskstu
            if let root = doc.rootElement {
                recurringNodeExplore(root)
                //zwaraca string
                return doc.serializedFragment
            }
        }
        return nil
    }
    
    func recurringNodeExplore(mutableNodes : HTMLNode) {
        for i in 0..<mutableNodes.numberOfChildren {
            let node = mutableNodes.childAtIndex(i)
            if node.numberOfChildren == 0 {
                let str = node.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                if !str.isEmpty {
                    print(node.textContent)
                    mutableNodes.editString(revString(node.textContent), atChildNodeIndex: i)
                    print(node.textContent)
                }
            } else {
                for j in 0..<node.numberOfChildren{
                    recurringNodeExplore(node.childAtIndex(j))
                }
            }
        }
    }
}