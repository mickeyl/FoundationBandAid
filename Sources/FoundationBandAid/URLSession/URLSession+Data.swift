//
// FoundationBandAid.
//
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

#if !canImport(ObjectiveC)

public extension URLSession {
    
    /**
    Downloads the contents of a URL and delivers the data asynchronously.
     */
    func data(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        try await data(for: URLRequest(url: url), delegate: delegate)
    }
    
    
    /**
    Downloads the contents of a URL based on the specified URL request and delivers the data asynchronously.
     */
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }
    
    /**
    Downloads the contents of a URL based on the specified URL request and delivers the data asynchronously.
     */
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {

        try await withCheckedThrowingContinuation { c in

            let task = dataTask(with: request) { data, response, error in
                if let error { c.resume(throwing: error) }
                else if let response, let data { c.resume(returning: (data, response)) }
                else { fatalError() }
            }
            task.resume()
        }
    }
}

#endif
