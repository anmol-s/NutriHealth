import Foundation
import Combine

class HttpRequest: ObservableObject {
    var food = "Holder"
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
        let str = String(decoding: data, as: UTF8.self)
        DispatchQueue.main.async {
            self.food = str
            print("self.food set to data")
            return
        }
    }.resume()

  }

}
