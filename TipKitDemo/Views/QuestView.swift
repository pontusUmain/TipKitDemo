//
//  QuestView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-03.
//

import SwiftUI

struct Quest {
    var title: String
    var points: Int
    
    init(title: String, points: Int) {
        self.title = title
        self.points = points
    }
    
    static var demoQuests: [Quest] = [
        .init(title: "Put on the Swift Boots", points: 10),
        .init(title: "Find the Flutter King", points: 20),
        .init(title: "Find the Script of Java", points: 5)
    ]
    
    static var completedQuests: [Quest] = [
        .init(title: "Get out of bed", points: 20),
        .init(title: "Slay the Kotleen Dragon", points: 100),
    ]
}

struct QuestView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    questSection(title: "Open quests", quests: Quest.demoQuests)
                    questSection(title: "Completed quests", quests: Quest.completedQuests)
                }
                .padding(.horizontal, 10)
            }
            .toolbar(content: {
                Button(action: {}) {
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                }
            })
        }
    }
    
    func questSection(title: String, quests: [Quest]) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .padding(.top, 20)
            
            ForEach(quests, id: \.title) {
                questView($0)
            }
        }
    }
    
    func questView(_ quest: Quest) -> some View {
        HStack {
            Text(quest.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(quest.points)p")
                .fontWeight(.light)
        }
        .padding(10)
        .background(
            Color.brown.opacity(0.5)
        )
    }
}

#Preview {
    QuestView()
}
