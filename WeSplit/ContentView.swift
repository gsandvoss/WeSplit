//
//  ContentView.swift
//  WeSplit
//
//  Created by glenn sandvoss on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandtotal = orderAmount + tipValue
        let amountPerPerson = grandtotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandtotal = orderAmount + tipValue
      
        return grandtotal
    }

    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
            }
            
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0..<tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
                
            Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            
            Section(header: Text("Grand total amount")){
                Text("$\(grandTotal, specifier: "%.2f")")
                }
      }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
 }
}


