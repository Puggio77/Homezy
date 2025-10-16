//
//  CalendarView.swift
//  homezy
//
//  Created by Riccardo Puggioni on 15/10/25.
//
/*
import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                
            //
            Text("Calendar")
                .font(.largeTitle)
                .bold()
                .padding(.top)
                .padding(.horizontal)
                
                
                //
                List{
                    Section{
                        Label("Fold clothes", systemImage: "tshirt.fill")
                        Label("Wash dishes", systemImage: "dishwasher.fill")
                        Label("Clean bathroom", systemImage: "shower.fill")
                        Label("clean the office", systemImage: "lamp.desk.fill")
                    } header: {
                        Text("To do's")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                    }//END HEADER
                }//END LIST
            }//END VSTACK
        }//END NAVIGATIONSTACK
    }
}

#Preview {
    CalendarView()
}*/


 import SwiftUI

 struct CalendarView: View {
     // La data attuale (mese mostrato)
     @State private var currentDate = Date()
     // La data selezionata quando tocchi un giorno
     @State private var selectedDate: Date? = nil
     // Mostra o nasconde il foglio (overlay)
     @State private var showOverlay = false
     
     var body: some View {
         NavigationStack {
             VStack(alignment: .leading) {
                 
                 Text("Calendar")
                     .font(.largeTitle)
                     .bold()
                     .padding(.top)
                     .padding(.horizontal)
                 
                 // MARK: upper calendar part
                 HStack {
                     Button(action: {
                         changeMonth(by: -1)
                     }) {
                         Image(systemName: "chevron.left")
                     }
                     
                     Spacer()
                     
                     Text(monthAndYearString(for: currentDate))
                         .font(.title3)
                         .bold()
                     
                     Spacer()
                     
                     Button(action: {
                         changeMonth(by: 1)
                     }) {
                         Image(systemName: "chevron.right")
                     }
                 }
                 .padding(.horizontal)
                 .padding(.bottom, 5)
                 
                 HStack {
                     ForEach(["SUN","MON","TUE","WED","THU","FRI","SAT"], id: \.self) { day in
                         Text(day)
                             .font(.caption)
                             .frame(maxWidth: .infinity)
                             .foregroundColor(.gray)
                     }
                 }
                 .padding(.horizontal, 8)
                 
                 // show days
                 CalendarGrid(
                     currentDate: currentDate,
                     selectedDate: $selectedDate,
                     showOverlay: $showOverlay
                 )
                 .padding(.horizontal)
                 .padding(.bottom, 20)
                 
                 //MARK: - To do's Section
                 List{
                     Section{
                         Label("Fold clothes", systemImage: "tshirt.fill")
                         Label("Wash dishes", systemImage: "dishwasher.fill")
                         Label("Clean bathroom", systemImage: "shower.fill")
                         Label("clean the office", systemImage: "lamp.desk.fill")
                     } header: {
                         Text("To do's")
                             .font(.title)
                             .bold()
                             .foregroundColor(.black)
                     }//END HEADER
                 }//END LIST
                 
             }

             .sheet(isPresented: $showOverlay) {
                 if let date = selectedDate {
                     VStack(spacing: 20) {
                         Text(date, style: .date)
                             .font(.title)
                             .bold()
                         List{
                             Section{
                                 Label("Fold clothes", systemImage: "tshirt.fill")
                                 Label("Wash dishes", systemImage: "dishwasher.fill")
                                 Label("Clean bathroom", systemImage: "shower.fill")
                                 Label("clean the office", systemImage: "lamp.desk.fill")
                             } header: {
                                 Text("Challenge completed on this day")
                                     .font(.title)
                                     .bold()
                                     .foregroundColor(.black)
                             }//END HEADER
                         }//END LIST
                         Button("Chiudi") {
                             showOverlay = false
                         }
                         .padding()
                     }
                     .presentationDetents([.medium])
                 }
             }
         }
     }
     
     // MARK: - Funzioni utili
     
     func changeMonth(by value: Int) {
         // Cambia mese avanti o indietro
         if let newDate = Calendar.current.date(byAdding: .month, value: value, to: currentDate) {
             currentDate = newDate
         }
     }
     
     func monthAndYearString(for date: Date) -> String {
         let formatter = DateFormatter()
         formatter.dateFormat = "LLLL yyyy"
         return formatter.string(from: date).capitalized
     }
 }

 struct CalendarGrid: View {
     var currentDate: Date
     @Binding var selectedDate: Date?
     @Binding var showOverlay: Bool
     
     let calendar = Calendar.current
     
     // day's dot
     let completedDays = [
         4, 8, 15, 21
     ]
     
     var body: some View {
         // Quanti giorni ha il mese
         let daysInMonth = calendar.range(of: .day, in: .month, for: currentDate)!
         // Primo giorno del mese (serve per allineare la griglia)
         let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
         let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
         // Totale celle nella griglia
         let totalCells = daysInMonth.count + (firstWeekday - 1)
         
         LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
             ForEach(0..<totalCells, id: \.self) { index in
                 if index < firstWeekday - 1 {
                     // Spazi vuoti prima dell'inizio del mese
                     Color.clear.frame(height: 40)
                 } else {
                     let day = index - (firstWeekday - 2)
                     let dayDate = calendar.date(bySetting: .day, value: day, of: firstDayOfMonth)!
                     let isToday = calendar.isDateInToday(dayDate)
                     let hasActivity = completedDays.contains(day)
                     
                     VStack(spacing: 4) {
                         Text("\(day)")
                             .frame(width: 32, height: 32)
                             .background(isToday ? Color.blue.opacity(0.2) : Color.clear)
                             .clipShape(Circle())
                             .foregroundColor(isToday ? .blue : .primary)
                         
                         if hasActivity {
                             Circle()
                                 .fill(Color.orange)
                                 .frame(width: 6, height: 6)
                         }
                     }
                     .onTapGesture {
                         selectedDate = dayDate
                         showOverlay = true
                     }
                 }
             }
         }
     }
 }

 #Preview {
     CalendarView()
 }

