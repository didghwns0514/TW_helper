//
//  ContentView.swift
//  TWHelper
//
//  Created by 양호준 on 2022/11/24.
//

import SwiftUI

struct Option: Hashable{
    let title: String;
    let imageName: String;
}

struct ContentView: View {
    
    @State var currentOption = 0;
    
    let options: [Option] = [
        .init(title: "Home1", imageName: "house1"),
        .init(title: "Home2", imageName: "house2"),
    ]
    
    var body: some View {
        NavigationView {
            ListView(options: options,
                     currentSelection: $currentOption
            );
            
            switch currentOption {
            case 1:
                Text("about ios")
            default:
                MainView()
            }

        }
        .frame(minWidth: 400, minHeight: 100, maxHeight: 100)
    }
}

struct ListView: View{
    let options: [Option]
    @Binding var currentSelection: Int;
    
    
    var body: some View{
        VStack{
            let current = options[currentSelection]
            ForEach(options, id: \.self) { option in
                HStack{
//                    Image(systemName: option.imageName)
//
//
                    Text(option.title)
                        .foregroundColor(current == option ?
                                         Color(.linkColor) : Color(.labelColor)
                        )
//                        .resizable( )
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:70)
//                    Spacer()
                }.padding()
                    .onTapGesture {
                        if currentSelection == 1{
                            currentSelection = 0
                        } else if currentSelection == 0{
                            currentSelection = 1
                        }
                    }
//                Spacer()
            }
        }
    }
}

struct MainView: View{
    var body: some View{
        Text("List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
