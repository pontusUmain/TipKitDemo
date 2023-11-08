//
//  ShareView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI

struct ShareView: View {
    
    let friends: [Person]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Share your progress")
                .font(.headline)
            ForEach(friends, id: \.name) { friend in
                nameSection(friend.name)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 20)
        .background(Color.orange.opacity(0.5))
        .cornerRadius(20)
    }
    
    private func nameSection(_ name: String) -> some View {
            NavigationLink {
                Text(name)
            } label: {
                HStack {
                    Image(systemName: "person.circle.fill")
                    Text(name)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
    }
}

struct Person {
    let name: String
    
    static let demo: [Person] = [
        Person(name: "John Appleseed"),
        Person(name: "Mary Pearwater"),
        Person(name: "Simon Bananapeel")
    ]
}

#Preview {
    ShareView(friends: Person.demo)
}
