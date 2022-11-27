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
    let idxs: Int;
}

struct ContentView: View {
    
    @State var currentOption = 0;
    
    let options: [Option] = [
        .init(title: "Home1", imageName: "house1", idxs: 0),
        .init(title: "Home2", imageName: "house2", idxs: 1),
        .init(title: "Home3", imageName: "house3", idxs: 2),
    ]
    
    var body: some View {
        NavigationView {
            ListView(options: options,
                     currentSelection: $currentOption
            );
            
            switch currentOption {

            case 0:
                MainView()
            case 1:
                Text("about ios")
            case 2:
                Text("about ios")
                
            default:
                MainView()
            }

        }
//        .fixedSize()
        .frame(minWidth: 400, minHeight: 300, maxHeight: 300)
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
                        .padding()
                        .foregroundColor(current == option ?
                                         Color(.yellow) : Color(.labelColor)
                        )
//                        .resizable( )
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width:70)
//                    Spacer()
                }.padding()
                    .onTapGesture {
//                        if currentSelection == 1{
//                            currentSelection = 0
//                        } else if currentSelection == 0{
//                            currentSelection = 1
//                        }
                        if option.idxs == 0{
                            currentSelection = 0
                        } else if option.idxs == 1{
                            currentSelection = 1
                        } else if option.idxs == 2{
                            currentSelection = 2
                        }
                    }
                Spacer()
//                indexnum = indexnum + 1
            }
//                            Spacer()
        }
    }
}

struct MainView: View{
    @State var text1: String = ""
    @State var text2: String = ""
    
    var body: some View{
        VStack{
            TextEditor(text: $text1)
              .cornerRadius(2)
              .padding(1)
              .background(.yellow)
            
            TextEditor(text: $text2)
              .cornerRadius(2)
              .padding(1)
              .background(.yellow)
              .disabled(true)
            HStack{

                Button("Grammer Check") {
                        print("Normal")
                        }
                Button("Copy Formatted") {
                        print("Formatted")
                        }
            }
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

