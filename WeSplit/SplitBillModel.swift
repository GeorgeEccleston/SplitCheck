//
//  SplitBillModel.swift
//  WeSplit
//
//  Created by GeorgeAdmin on 1/17/24.
//

import Foundation

struct SplitBillModel<Amount> {

    private var billAmount: Double
    private var tipPercent: Int
    private var tipAmount: Double
    private var billAmountWithTip: Double
    private var splitBillAmount: Double
    private var personAmount: Double
    
    init(billAmount: Double, tipPercent: Int, tipAmount: Double, billAmountWithTip: Double, splitBillAmount: Double, personAmount: Double) {
        self.billAmount = billAmount
        self.tipPercent = tipPercent
        self.tipAmount  = tipAmount
        self.billAmountWithTip = billAmountWithTip
        self.splitBillAmount = splitBillAmount
        self.personAmount = personAmount
    }
    
    mutating func tip(bill: Double, tipPercent: Int) -> Double {
        tipAmount = bill * Double(tipPercent)/100
        return tipAmount
    }
    
    mutating func billPlusTip(bill: Double, amountOfTip: Double) -> Double {
        billAmountWithTip = bill + amountOfTip
        return billAmountWithTip
    }
    
    mutating func splitCheck(billAmountWithTip: Double, numberPeople: Int) -> Double {
        personAmount = billAmountWithTip / Double(numberPeople)
        return personAmount
    }
}
