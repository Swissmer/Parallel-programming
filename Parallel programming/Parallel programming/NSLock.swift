import Foundation

/*
 NSLock — это полезный инструмент для синхронизации доступа к общим ресурсам в Swift и Objective-C.
 */

class NSLCK {
    func simpleTest() {
        let lock = NSLock()
        var data = [String]()
        
        DispatchQueue.global().async {
            lock.lock()
            data.append("Write data")
            lock.unlock()
        }
        
        DispatchQueue.global().async {
            lock.lock()
            print(data)
            lock.unlock()
        }
    }
    
    // DeadLock
    func deadLock() {
        let lock = NSLock()
        
        DispatchQueue.global().async {
            lock.lock()
            print("First lock acquired")
            
            lock.lock() // Deadlock
            print("Second lock acquired")
        }
    }
}
