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
     Uploads data to a URL and delivers the result asynchronously.
     */
    func upload(for request: URLRequest, fromFile fileURL: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        let fileData = try Data(contentsOf: fileURL)
        return try await upload(for: request, from: fileData, delegate: delegate)
    }
    
    /**
     Uploads data to a URL based on the specified URL request and delivers the result asynchronously.
     */
    func upload(for request: URLRequest, from bodyData: Data) async throws -> (Data, URLResponse) {
        try await upload(for: request, from: bodyData, delegate: nil)
    }
    
   /**
     Uploads data to a URL based on the specified URL request and delivers the result asynchronously.
     */
    func upload(for request: URLRequest, from bodyData: Data, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        
        try await withCheckedThrowingContinuation { c in

            let task = uploadTask(with: request, from: bodyData) { data, response, error in
                if let error { c.resume(throwing: error) }
                else if let response, let data { c.resume(returning: (data, response)) }
                else { c.resume(throwing: Self.InternalError()) }
            }
            task.resume()
        }
    }    
}

#endif
