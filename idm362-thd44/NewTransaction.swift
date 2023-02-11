//
//  NewTransaction.swift
//  idm362-thd44
//
//  Created by Ty Drake on 2/9/23.
//

import SwiftUI

struct NewTransaction: View {
    @State var amount = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Amount", text: $amount)
                TextField("Amount", text: $amount)
            }
        }
    }
}

struct NewTransaction_Previews: PreviewProvider {
    static var previews: some View {
        NewTransaction()
    }
}
