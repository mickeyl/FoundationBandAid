//
// FoundationBandAid.
//
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

#if !canImport(ObjectiveC)

public extension URLSession {

    struct InternalError: Error {}
}

#endif
