# FoundationBandAid

A desperate attempt in fixing some of the biggest warts in [swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation/).

## Motivation

Swift-Corelibs-Foundation is an "open source" re-implementation of the Apple's Foundation library and it is in a bad state.
Although (major) issues and pull requests are coming in and the community would love
to contribute to make it more useful on non-Apple-platforms, it seems abandonded by Apple and the gatekeepers are not letting
important fixes in.

The real way to fix this is to fork it. Until this happens, this library tries to do what's possible in minimizing the functionality
gaps.

## Functionality

- [x] URLSession Async API (Part 1, async versions of tasks), see https://github.com/swiftlang/swift-corelibs-foundation/pull/4970
 - This seems to be in Swift 6.0 (which is problematic on Linux for other things), so we can probably remove it eventually.
- [ ] URLSession Async API (Part 2, lines API), see https://github.com/swiftlang/swift-corelibs-foundation/pull/3036
 - Not yet implemented
- [x] RunLoop.getCFRunLoop API substitute (which is now `internal` on Linux, see https://github.com/swiftlang/swift/issues/75498
 - Might be reverted in Swift 6.1, let's see.

Hopefully a lot more to come. I'd be grateful for contributions.
