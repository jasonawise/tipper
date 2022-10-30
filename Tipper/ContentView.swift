//
//  ContentView.swift
//  Tipper
//
//  Created by Jason Wise on 10/27/22.
//

import SwiftUI

struct ContentView: View {
  @State private var selected = 0
  @State private var billAmount: Double = 0.0
  @State private var totalBillAmount: Double = 0.0
  @State var tipAmount: Double = 0.0
  
  var body: some View {
    NavigationView {
      VStack (alignment: .leading) {
        HStack {
          Section {
            TextField("Bill Amount", value: $billAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
              .keyboardType(.decimalPad)
          } header: {
            Text("Bill Amount: ")
              .font(.title)
          }
          .padding(.bottom)
        }
        .navigationTitle("Tipper")
        VStack  {
          Text("Pick a tip percent")
            .fontWeight(.light)
        }
        HStack {
          Picker(selection: $selected, label: Text("Tip Percent")) {
            Text("10%").tag(1)
            Text("20%").tag(2)
            Text("25%").tag(3)
          }
          .onChange(of: selected, perform: { _ in
            calculateTipTotal()
            calculateBillTotal()
          })
          .pickerStyle(.segmented)
        }
        HStack {
          Section {
            Text(tipAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
              .padding()
              .foregroundColor(.gray)
          } header: {
            Text("Sugguested Tip: ")
          }
        }
        HStack {
          Section {
            Text(totalBillAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
              .padding()
              .foregroundColor(.gray)
          } header: {
            Text("Amount you owe: ")
              .font(.headline)
          }
        }
        Spacer()
      }
      .padding()
    }
    
  }
  
  func calculateTipTotal() {
    var tipPercent = 0.0
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
  
  func calculateBillTotal() {
    let tip = tipAmount
    let bill = billAmount
    return totalBillAmount = bill + tip
  }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
