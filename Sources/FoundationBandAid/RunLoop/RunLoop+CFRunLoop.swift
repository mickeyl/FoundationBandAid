import Foundation
#if canImport(CoreFoundation)
import CoreFoundation
#endif

extension RunLoop {
#if canImport(ObjectiveC)
    @inlinable @inline(__always)
    public var CC_cfRunLoop: CFRunLoop { self.getCFRunLoop() }
#else
    @inlinable @inline(__always)
    public var CC_cfRunLoop: CFRunLoop { unsafeBitCast(self, to: CFRunLoop.self) }
#endif
}
