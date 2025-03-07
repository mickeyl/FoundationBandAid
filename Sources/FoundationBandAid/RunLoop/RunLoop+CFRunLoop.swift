#if compiler(>=6.0)
import Foundation
#if canImport(CoreFoundation)
import CoreFoundation
#endif

extension RunLoop {
    @inlinable
    @inline(__always)
    var CC_cfRunLoop: CFRunLoop { unsafeBitCast(self, to: CFRunLoop.self) }
}
#endif
