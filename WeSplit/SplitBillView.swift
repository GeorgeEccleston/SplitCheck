//  SplitBillView.swift
//  Day 16 - Project 1: WeSplit
//  Created by GeorgeAdmin on 10/9/23.
//

import SwiftUI

struct SplitBillView: View {
    @State private var billAmount: Double = 0
    @State private var numberPeople: Int = 2
    @State private var tipPercent: Int = 10
    
    @State private var tipAmount: Double = 0
    @State private var billWithTip: Double = 0
    @State private var personAmount: Double = 0

    
    var body: some View {
        
        let splitBillCalculation = SplitBillVM()

        
    NavigationStack {
            Form {
                Section("Enter Bill Amount") {
                    TextField("Enter Bill Amount", value: $billAmount, format: .number)

                        .fontWeight(.heavy)
                }
                
                Section("Select Number of People") {
                    Picker("People Count", selection: $numberPeople) {
                        ForEach(splitBillCalculation.peopleCount, id: \.self) {
                            Text($0.formatted())
                                .fontWeight(.heavy)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select tip percentage") {
                    Picker("TipPercentage", selection: $tipPercent) {
                        ForEach(splitBillCalculation.tipSelection, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    HStack {
                        Text("Selected Tip Amount = ")
                        if tipPercent != 0 {
                            Text(billAmount * Double(tipPercent)/100, format: .number)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                        } else {
                            Text(billAmount * Double(tipPercent)/100, format: .number)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.red)
                        }
                    }
//                    HStack {
//                        if tipPercent != 0 {
//                            Text("Bill plus Tip = ")
//                        } else {
//                            Text("Bill with no Tip = ")
//                                .fontWeight(.heavy)
//                                .foregroundColor(Color.red)
//                        }
//                        Text(billAmount * (1.0 + Double(tipPercent)/100), format: .number)
//                            .fontWeight(.heavy)
//                            .foregroundColor(Color.blue)
//                    }
                }

                Section("Amount for each person") {
                    Text((billAmount * (1.0 + Double(tipPercent)/100) / Double(numberPeople)), format: .number)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.blue)
                }
            }
            .navigationTitle("SplitCheck")
        }
    }
    
}


#Preview {
    SplitBillView()
}
