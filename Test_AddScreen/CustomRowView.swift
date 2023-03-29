//
//  CustomRowView.swift
//  Test_AddScreen
//
//  Created by Tom Flahive on 3/28/23.
//

import SwiftUI

struct CustomRowView: View {
    let item: ListItem
    var onInfoButtonTap: (() -> Void)?
    var onRowTap: (() -> Void)?

    var body: some View {
        HStack {
            Text(item.title)
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                onInfoButtonTap?()
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onRowTap?()
        }
    }
}
