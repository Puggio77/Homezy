//
//  HomePageView.swift
//  homezy
//
//  Created by Riccardo Puggioni on 15/10/25.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationStack{
            VStack{
                //MARK: - To do's Section
                List{
                    Section{
                        ForEach(todo, id: \.id) { item in
                            NavigationLink(destination: ChallengeView(todoItem: item)) {
                                HStack {
                                    Image(systemName: item.icon)
                                        .foregroundColor(.blue)
                                    Text(item.title)
                                }//end hstack
                            }//end navigationlink
                        }//end for each
                    } header: {
                        Text("To do's")
                            .font(.title)
                            .bold()
                    }//END HEADER
                }//END LIST
            }
            .navigationTitle("Homepage")
        }
    }
}

#Preview {
    HomePageView()
}
