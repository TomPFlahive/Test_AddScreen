//
//  ContentView.swift
//  Test_AddScreen
//
//  Created by Tom Flahive on 3/28/23.
//

// 1. Add code from SwiftLee to navigate to screen when info button is clicked.

import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    
    @State var selectedFavorite: String?
    @State private var expandedRow: UUID?
    
    let items: [ListItem] = [
        ListItem(title: "Item 1"),
        ListItem(title: "Item 2"),
        ListItem(title: "Item 3")
    ]

    var body: some View {
        NavigationView {
            List(items) { item in
                CustomRowView(item: item, onInfoButtonTap: {
                    print("Info button tapped for \(item.title)")
                    selectedFavorite = item.title
                }, onRowTap: {
                    if expandedRow == item.id {
                        expandedRow = nil
                    } else {
                        expandedRow = item.id
                    }
                    print("Row tapped for \(item.title)")
                })
                if expandedRow == item.id {
                    Text(item.id.uuidString)
                        .background(Color.green)
                    //DetailView()
                        //.transition(.slide)
                        //.animation(.easeInOut(duration: 1), value: expandedRow)
                }
            }
            .navigationDestination(for: $selectedFavorite) { item in
                Text(item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

