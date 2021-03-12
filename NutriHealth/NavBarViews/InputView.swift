import SwiftUI

struct InputView: View {

@State private var query: String = ""
@State var isSearching = false
@State var manager = HttpRequest()

var body: some View {
    NavigationView{
        ScrollView{
            HStack {
                HStack{
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
                        query=""
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
            }) {
                HStack{
                    Spacer()
                    Text("Search")
                    Spacer()
                }
                .accentColor(Color.white)
                .padding(.vertical, 10)
                .background(Color.red)
                .cornerRadius(5)
                .padding(.horizontal, 40)

            }
            Button(action: {
                print(self.manager.food)
            }) {
                HStack{
                    Spacer()
                    Text("Print food to console")
                    Spacer()
                }
                .accentColor(Color.white)
                .padding(.vertical, 10)
                .background(Color.red)
                .cornerRadius(5)
                .padding(.horizontal, 40)

            }
        }
        .navigationTitle("Food Input")
        Text(self.manager.food)
    }
   }
  }

  struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
   }
