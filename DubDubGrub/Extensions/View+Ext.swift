//
//  View+Ext.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import SwiftUI

extension View {
    func profileNameStyle() -> some View {
        self.modifier(ProfileNameText())
    }
}
