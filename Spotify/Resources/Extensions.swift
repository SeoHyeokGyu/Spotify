//
//  Extentions.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation
import UIKit

extension UIView{
    
    var width: CGFloat{
        return frame.size.width
    }
    var height: CGFloat{
        return frame.size.height
    }
    var left: CGFloat{
        return frame.origin.x
    }
    var right: CGFloat{
        return left + width
    }
    var top: CGFloat{
        return frame.origin.y
    }
    var bottom: CGFloat{
        return top + height
    }
}


extension DateFormatter {
    static let dateFormetter: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter
    }()
    static let DisplaydateFormetter: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
}

extension String {
    static func formettedDate(string: String) -> String{
        guard let date = DateFormatter.dateFormetter.date(from: string) else {
            return string
        }
        return DateFormatter.DisplaydateFormetter.string(from: date)
    }
}

extension Notification.Name {
    static let albumSavedNotification = Notification.Name("albumSavedNotification")
}
