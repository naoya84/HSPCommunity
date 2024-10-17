import Foundation

protocol FetchSeed {
    func getSeeds() async throws -> [Seed]
    func postSeed(text: String) async throws
    func addFavorite(seedId: Int) async throws -> [Seed]
}

struct FetchSeedImpl: FetchSeed {
    func getSeeds() async throws -> [Seed] {
        let requestUrl = URL(string: "http://localhost:8080/seeds")!
        let (data, _) = try await URLSession.shared.data(from: requestUrl)
        let decorder = JSONDecoder()
        let decordedSeeds = try decorder.decode([Seed].self, from: data)
        return decordedSeeds
    }
    
    func postSeed(text: String) async throws {
        let requestUrl = URL(string: "http://localhost:8080/seeds")!
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["text": text]
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(body)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
        }
    }
    
    func addFavorite(seedId: Int) async throws -> [Seed] {
        let requestUrl = URL(string: "http://localhost:8080/seeds/favorite/\(seedId)")!
        let (data, _) = try await URLSession.shared.data(from: requestUrl)
        let decorder = JSONDecoder()
        let decordedSeeds = try decorder.decode([Seed].self, from: data)
        return decordedSeeds
    }
}
