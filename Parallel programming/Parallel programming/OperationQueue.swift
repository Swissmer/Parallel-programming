import Foundation

/*
 OperationQueue — это высокоуровневый API для управления очередями работ в Swift и Objective-C, построенный на основе Grand Central Dispatch (GCD).
 */

class OperationQueueSelf {
    
    func simpleTest() {
        let operation = BlockOperation {
            print("Hello from operation!")
        }
        // Создаем новую очередь операций
        let queue = OperationQueue()
        // Добавляем операцию в очередь
        queue.addOperation(operation)
    }
    
    // Зависимости
    func dependencies() {
        let firstOperation = BlockOperation {
            print("First operation")
        }
        let secondOperation = BlockOperation {
            print("Second operation")
        }
        secondOperation.addDependency(firstOperation)
        let queue = OperationQueue()
        queue.addOperations([firstOperation, secondOperation], waitUntilFinished: false)
    }
    
    // Отмена опереции
    func cancelingOperations() {
        let operation = BlockOperation {
            print("Operation started")
            Thread.sleep(forTimeInterval: 2)
            print("Operation finished")
        }
        let queue = OperationQueue()
        queue.addOperation(operation)
        // Отменить операцию
        operation.cancel()
    }
    
    // Ограничение параллелизма
    func concurrencyLimit() {
        let queue = OperationQueue()
        // Ограничиваем максимальное количество операций, выполняемых одновременно, до 2
        queue.maxConcurrentOperationCount = 2
        
        // ...
    }
}
