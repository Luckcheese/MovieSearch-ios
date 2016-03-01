import Foundation
import ObjectMapper

class StringToInt: TransformType {
    public typealias Object = Int
    public typealias JSON = String

    public init() {}

    public func transformFromJSON(value: AnyObject?) -> Int? {
        if let v = value as? String {
            return Int(v)
        }
        return nil
    }

    public func transformToJSON(value: Int?) -> String? {
        if let v = value {
            return String(v)
        }
        return nil
    }
}
