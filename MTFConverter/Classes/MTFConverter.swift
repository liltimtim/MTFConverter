//
//  MTFConverter.swift
//  Pods
//
//  Created by Timothy Barrett on 9/18/16.
//
//

import UIKit
import Eureka
public class MTFConverter: NSObject {
    
    public static func convertJSONForm(json:[String:AnyObject]) -> Form? {
        var form = Form()
        var rows = [BaseRow]()
        for (key, value) in json {
            print(key)
            print(value)
            guard let aRow = MTFConverter.returnRowType(withKeyedTag: key, withValue: value) else {
                print("invalid row")
                return nil
            }
            rows.append(aRow)
        }
        form += [Section()]
        form.allSections.first!.appendContentsOf(rows)
        return form
    }
    
    public static func returnRowType(withKeyedTag tag:String, withValue value:AnyObject) -> BaseRow? {
        switch (value) {
        case is String:
            print("I'm a string")
            let textRow = TextRow(tag) {
                $0.title = "Hello world"
            }
            return textRow
        case is Double:
            print("I'm a double")
            return DecimalRow(tag: tag)
            
        default:
            print("error")
            assertionFailure("Bad data type given to converter")
            return nil
        }
    }
}
