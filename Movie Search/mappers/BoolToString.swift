import Foundation
import ObjectMapper

class BoolToString: TransformType {
    public typealias Object = Bool
    public typealias JSON = String

    public init() {}

    public func transformFromJSON(value: AnyObject?) -> Bool? {
        if let v = value as? String {
            return v.toBool()
        }
        return nil
    }

    public func transformToJSON(value: Bool?) -> String? {
        if let v = value {
            return v ? "True" : "False"
        }
        return nil
    }}
