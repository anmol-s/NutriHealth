import Foundation
import Combine

struct foods : Codable {
    struct food : Codable{
        struct full_nutrients : Codable{
            let attr_id : Int
            let value : Double
        }
        struct photo : Codable{
            let thumb : String
            let highres : String
            let is_user_uploaded : Bool
        }
        let food_name : String
        let serving_qty : Int
        let serving_unit : String
        let serving_weight_grams : Int
        let nf_calories : Float
        let nf_total_fat : Float
        let nf_saturated_fat : Float
        let nf_cholesterol : Float
        let nf_sodium : Float
        let nf_dietary_fiber : Float
        let nf_total_carbohydrate : Float
        let nf_sugars : Float
        let nf_protein : Float
        let nf_potassium : Float
        let nf_p : Float
        let full_nutrients : [full_nutrients]
        let photo : photo
        }
    let foods : [food]
}

class HttpRequest: ObservableObject {
    var food = "Holder"
    var foodData = foods(foods:[foods.food(food_name: "", serving_qty: 0, serving_unit: "", serving_weight_grams: 0, nf_calories: 0, nf_total_fat: 0, nf_saturated_fat: 0, nf_cholesterol: 0, nf_sodium: 0, nf_dietary_fiber: 0, nf_total_carbohydrate: 0, nf_sugars: 0, nf_protein: 0, nf_potassium: 0, nf_p: 0, full_nutrients: [foods.food.full_nutrients(attr_id: 0, value: 0)], photo: foods.food.photo(thumb: "", highres: "", is_user_uploaded: false))])
    func postRequest(query: String) {
        guard let url = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients") else { return }

        let body: [String: String] = ["query": query]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

    var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("8fdbe379", forHTTPHeaderField: "x-app-id")
        request.setValue("b0636fafdd5be6849df01cf01aa34469", forHTTPHeaderField: "x-app-key")

    URLSession.shared.dataTask(with: request) { (data, response, error) in

        guard let data = data else { return }
        let decorder = JSONDecoder()
        guard let loaded = try? decorder.decode(foods.self, from: data) else {
            fatalError("Unable to decode \(data)")
        }
        let str = String(decoding: data, as: UTF8.self)
        DispatchQueue.main.async {
            self.foodData = loaded
            self.food = str
            return
        }
    }.resume()

  }

}
