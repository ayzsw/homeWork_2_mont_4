//
//  ContentView.swift
//  homeWork_2_mont_4
//
//  Created by Аяз on 18/5/23.
//

import SwiftUI

struct ContentView: View {

    private let foods:[Food1] = [Food1(image: "eat1",
                                       nameFood: "Tony Roma'a",
                                       opisanieFood: "Ribs & Steaks",
                                       price: " Delivery: FREE • Minimum: $20"),
                                 Food1(image: "momos",
                                       nameFood: "Momos",
                                       opisanieFood: "Japanes",
                                       price: "Delivery: FREE • Minimum: $10"),
                                 Food1(image: "lagman",
                                       nameFood: "Lagman",
                                       opisanieFood: "Kyrgyzstan",
                                       price: "Delivery: FREE • Minimum: $5")]
    
    private let foods2:[Food2] = [Food2(image2: "food4",
                                        nameFood2: "Paul",
                                        opisanieFood2: "French Pasta",
                                        priceFood2: "Delivery: FREE • Minimum: $0"),
                                  Food2(image2: "besh",
                                        nameFood2: "Besh Barmak",
                                        opisanieFood2: "Kyrgyz dishes",
                                        priceFood2: "Delivery: FREE • Minimum: $15")]
    
    var imageButton: [Image] = [Image(systemName: "trash"),
                              Image(systemName: "car"),
                              Image(systemName: "fish"),
                              Image(systemName: "house"),
                              Image(systemName: "folder")]
    
    var textButton: [String] = ["Trash", "Car", "Fish", "House", "Folder"]
    
    @State var selectIndex: Int = 0
    
    @State var textFromTF: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30){
                        NavigationBarVIew()
                        
                        HStack{
                            ForEach(0..<5) { index in
                                ButtonSliderView(image: imageButton[index],
                                                 title: textButton[index],
                                                 isSelect: selectIndex == index)
                                .padding()
                                .onTapGesture {
                                    selectIndex = index
                                    print(selectIndex)
                                }
                            }
                        }
                        
                        Text("56 stores open")
                            .bold()
                        
                        SearchbarView(textFromTF: $textFromTF)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(foods,id: \.self) { food in
                                    food
                                }
                            }
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(foods2,id: \.self) { food2 in
                                    food2
                                }                        }
                        }
                    }
                    .padding()
                }
                TabBarView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationBarVIew: View {
    var body: some View {
        HStack{
            Button {
                //
            } label: {
                Image("menu")
                    .resizable()
                    .frame(width: 25, height: 23)
                    .foregroundColor(.black)
            }
            Spacer()
            Button {
                //
            } label: {
                VStack{
                    Text("Delivering to")
                        .font(.system(size: 14))
                    
                    HStack{
                        Text("Manas Ave")
                            .font(.system(size: 18))
                            .bold()
                        Image("vector")
                            .resizable()
                            .frame(width: 7.2, height: 12)
                        
                    }
                }
                .foregroundColor(.black)
            }
            Spacer()
            NavigationLink {
                ThirdView()
            } label: {
                Image("basket")
                    .resizable()
                    .frame(width: 50, height: 47)
                    .foregroundColor(.black)
            }
            
        }
        .padding(.horizontal)
    }
}

struct SearchbarView: View {
    
    @Binding var textFromTF: String
    
    var body: some View {
        HStack{
            HStack{
                Image("search")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                TextField("Find restaurant by name",
                          text: $textFromTF)
            }
            .padding(.all, 18)
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 6)
            
            Button {
                //
            } label: {
                Image("filter")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .padding()
        }
    }
}

struct Food1: View,Hashable {
    
    let image: String
    let nameFood: String
    let opisanieFood: String
    
    let price: String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width: 150, height: 150)
            Text(nameFood)
                .font(.system(size: 16))
                .bold()
            Text(opisanieFood)
                .font(.system(size: 10))
            Text(price)
                .font(.system(size: 10))
            
            HStack{
                Image("star")
                    .resizable()
                    .frame(width: 11, height: 11)
                Text("4.5")
                    .bold()
                
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.gray)
                Image("clock")
                    .resizable()
                    .frame(width: 11, height: 11)
                Text("35 Mins")
                    .bold()
            }
            Spacer()
        }
        .padding(.all,6)
        .background(.white)
        .frame(width: 169, height: 250)
        .cornerRadius(25)
        .shadow(radius: 3)
    }
}

struct Food2: View, Hashable {
    let image2: String
    let nameFood2: String
    
    let opisanieFood2: String
    
    let priceFood2: String
    var body: some View {
        HStack{
            VStack{
                Text(nameFood2)
                    .font(.system(size: 19))
                    .bold()
                Text(opisanieFood2)
                    .font(.system(size: 14))
                Text(priceFood2)
                    .font(.system(size: 14))
            }
                Image(image2)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.leading)
            }
            .padding(.all,6)
            .background(.white)
            .frame(width: 350, height: 130)
            .cornerRadius(25)
            .shadow(radius: 3)
        }
    }

struct TabBarView: View {
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button {
                    //
                } label: {
                    Image("home")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Spacer()
                }
                Button {
                    //
                } label: {
                    Image("wallet")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Spacer()
                }
                Button {
                    //
                } label: {
                    Image("chat")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Spacer()
                }
                Button {
                    //
                } label: {
                    Image("contact")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(.all)
            }
            .padding(.all)
            
            .background(Color.black)
            .cornerRadius(25)
            .frame(width: 335)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}



struct ButtonSliderView: View {
    
    var image: Image
    
    var title: String
    
    var isSelect: Bool
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .shadow(radius: 299)
            
            if isSelect{
                Text(title)
                    .font(.system(size: 16))
            }
        }
        .frame(width: isSelect ? 80 : 30, height: 30)
        .background(isSelect ? .black : .clear)
        .foregroundColor(isSelect ? .white : .black)
        .cornerRadius(10)
        .shadow(radius: 30)
    }
}
