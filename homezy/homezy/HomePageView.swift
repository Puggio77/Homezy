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
                            HStack {
                                Image(systemName: item.icon)
                                    .foregroundColor(.blue)
                                Text(item.title)
                            }
                        }
                    } header: {
                        Text("To do's")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
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
