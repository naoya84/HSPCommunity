import Foundation

protocol SeedRepository {
    var fetchSeed: FetchSeedData { get }
    func getSeeds() async throws -> [Seed]
    func postSeeds(text: String) async throws
}

class SeedRepositoryImpl: SeedRepository {
    let fetchSeed: FetchSeedData
    
    init(fetchSeed: FetchSeedData) {
        self.fetchSeed = fetchSeed
    }
    
    func getSeeds() async throws -> [Seed] {
        return try await fetchSeed.getSeeds()
    }
    
    func postSeeds(text: String) async throws {
        try await fetchSeed.postSeed(text: text)
    }
}


class FetchSeedData {

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
}

