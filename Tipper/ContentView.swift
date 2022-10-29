//
//  ContentView.swift
//  Tipper
//
//  Created by Jason Wise on 10/27/22.
//

import SwiftUI

struct ContentView: View {
  @State private var selected = 1
  @State private var billAmount: Double = 0.0
  @State private var totalBillAmount: Double = 0.0
  // may be able to move this to the caculateBillTotal func
  @State var tipPercent: Double = 0.0
  @State var tipAmount: Double = 0.0
  
  var body: some View {
    VStack {
      HStack {
        Picker(selection: $selected, label: Text("Tip Percent")) {
          Text("10%").tag(1)
          Text("20%").tag(2)
          Text("25%").tag(3)
        }
        .pickerStyle(.segmented)
      }
      HStack {
        Section {
          TextField("Bill Amount", value: $billAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .keyboardType(.decimalPad)
          Button("Calculate Tip", action: calculateTipTotal)
            .buttonStyle(.bordered)
        } header: {
          Text("Bill Amount: ")
        }
      }
      HStack {
        Section {
          Text(tipAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .padding()
        } header: {
          Text("Sugguested Tip: ")
        }
      }
    }
    .padding()
  }
  
  func calculateTipTotal() {
    switch selected {
    case 1:
      tipPercent = 0.10
    case 2:
      tipPercent = 0.20
    case 3:
      tipPercent = 0.25
    default:
      tipPercent = 0.05
    }
    let tipTotal = billAmount * tipPercent
    
    return tipAmount = tipTotal
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
