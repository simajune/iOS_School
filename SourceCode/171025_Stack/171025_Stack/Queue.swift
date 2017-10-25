
import Foundation

struct Queue<j> {
    
    private var queueTemp: [j] = []
    
    mutating func enQueue(_ data: j) {
        queueTemp.append(data)
    }
    
    mutating func deQueue() -> j {
        return queueTemp.removeFirst()
    }
    
}
