
import Foundation

struct Stack<j> {
    
    private var stackTemp: [j] = []
    
    mutating func push(_ data: j) {
        stackTemp.append(data)
    }
    
    mutating func pop() -> j {
        return stackTemp.removeLast()
    }
}
