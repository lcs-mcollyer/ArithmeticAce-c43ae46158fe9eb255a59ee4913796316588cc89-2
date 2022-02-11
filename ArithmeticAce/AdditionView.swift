//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...12)
    @State var addened = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctSum: Int {
        return augend + addened
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Text("+")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(augend)")
                    Text("\(addened)")
                }
            }
            
            Divider()
            
            HStack {
                ZStack{
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    //        CONDITION      true  false
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                        .opacity(answerCorrect == false && answerChecked == false ? 0.0 : 1.0)
                    
                    
                }
                Spacer()
                TextField("",
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
          
            ZStack{
                
            Button(action: {
                
                // Answer has been checked!
                answerChecked = true
                
                // Convert the input given to an integer, if possible
                guard let productGiven = Int(inputGiven) else {
                    // Sadness, not a number
                    answerCorrect = false
                    return
                }
                
                // Check the answer!
                if productGiven == correctSum {
                    // Celebrate! 👍🏼
                    answerCorrect = true
                } else {
                    // Sadness, they gave a number, but it's incorrect 😭
                    answerCorrect = false
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
                .opacity(answerChecked == false ? 1.0 : 0.0)
            Spacer()
        }
        
        
        
            
            
        Button(action: {
            addened = Int.random(in: 1...12)
            augend = Int.random(in: 1...12)
            
            answerChecked = false
            answerChecked = false
            
            
            //reset field where the user givens an asnwer
            //given = empty string
            inputGiven = ""
        }, label: {
            
            Text("New Question")
                .font(.largeTitle)
            
        })
        }
            .padding()
            .buttonStyle(.bordered)
            .opacity(answerChecked == true ? 1.0 : 0.0)
        
        
            .padding(.horizontal)
            .font(.system(size: 72))
        
        
        
        
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
