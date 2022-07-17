//
//  KeyboardClose.swift
//  StorageCli
//
//  Created by Ahmet OZBERK on 17.07.2022.
//

import Foundation
import SwiftUI

class KeyboardClose{
    static func fetch(){
        let keyWindow = UIApplication.shared.connectedScenes
                           .filter({$0.activationState == .foregroundActive})
                           .map({$0 as? UIWindowScene})
                           .compactMap({$0})
                           .first?.windows
                           .filter({$0.isKeyWindow}).first
        keyWindow!.endEditing(true)
    }
}
