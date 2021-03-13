import SwiftUI

struct InputView: View {

@State private var query: String = ""
@State var isSearching = false
@ObservedObject var manager = HttpRequest()

init(){
    UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
    UISegmentedControl.appearance().backgroundColor = UIColor.white
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
}
    
var body: some View
{
    NavigationView
    {
        VStack{
            Rectangle()
                .frame(height: 80)
                .foregroundColor(.blue)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            FoodPageTitle().offset(y:-41)
            Spacer()
        
        
        ScrollView
        {
            HStack
            {
                
                
                HStack
                {
                    TextField("Food Name", text: $query)
                        .padding(.leading, 24)
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(6)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    isSearching = true
                })
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                        if isSearching{
                            Button(action:{query=""}, label:{
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            })
                        }
                    }
                    .padding(.horizontal, 32)
                    .foregroundColor(.gray)
                ).transition(.move(edge: .trailing))
                .animation(.spring())
                if isSearching{
                    Button(action: {
                        isSearching=false
                    }, label:{
                        Text("Cancel")
                            .padding(.trailing)
                            .padding(.leading, 0)
                    })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                }
            }
            Button(action: {
                self.manager.postRequest(query: self.query)
                isSearching = false
                query = ""
            }) {
                HStack{
                    Spacer()
                    Text("Search").fontWeight(.semibold)
                    Spacer()
                }
                .accentColor(Color.white)
                .padding(.vertical, 10)
                .background(Color.blue)
                .cornerRadius(30)
                .padding(.horizontal, 40)

            }
            if(self.manager.foodData.foods[0].food_name != ""){
                HStack {
                    Text(self.manager.foodData.foods[0].food_name)
                        .padding()
                    Text(String(self.manager.foodData.foods[0].nf_calories) + " Calories")
                    Spacer()
                    Button(action: {
                        print("Food Added!")
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                    }
                }
            }
        }
//        .navigationTitle("Food Input")
    }.edgesIgnoringSafeArea(.top)
    }
   }
  }

  struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
   }

struct FoodPageTitle: View {
    var body: some View {
        Text("Food Input")
            .font(.system(size: 18)).fontWeight(.semibold)
    }
}
