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
     Retrieves the contents of a URL and delivers the URL of the saved file asynchronously.
     */
    func download(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (URL, URLResponse) {
        try await download(for: URLRequest(url: url), delegate: delegate)
    }

    /**
     Retrieves the contents of a URL based on the specified URL request and delivers the URL of the saved file asynchronously.
     */
    func download(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (URL, URLResponse) {
        
        try await withCheckedThrowingContinuation { c in

            let task = downloadTask(with: request) { url, response, error in

                if let error { c.resume(throwing: error) }
                else if let response, let url { c.resume(returning: (url, response)) }
                else { c.resume(throwing: Self.InternalError()) }
            }
            task.resume()
        }
    }

    /**
    Resumes a previously-paused download and delivers the URL of the saved file asynchronously.
     */
    func download(resumeFrom: Data, delegate: URLSessionTaskDelegate? = nil) async throws -> (URL, URLResponse) {
        
        try await withCheckedThrowingContinuation { c in

            let task = downloadTask(withResumeData: resumeFrom) { url, response, error in

                if let error { c.resume(throwing: error) }
                else if let response, let url { c.resume(returning: (url, response)) }
                else { c.resume(throwing: Self.InternalError()) }
            }
            task.resume()
        }
    }    
}

#endif
