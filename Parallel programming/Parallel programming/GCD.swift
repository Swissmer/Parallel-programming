import Foundation

/*
 Grand Central Dispatch (GCD) — это низкоуровневая библиотека, разработанная Apple, позволяющая управлять параллельными задачами в многопоточном окружении.
 */

/*
 1) Основная очередь - DispatchQueue.main
 2) Глобальная очередь - DispatchQueue.main
 3) Пользовательская очередь - DispatchQueue(label: "com.example.queue")
 */

class GDC {
    
    // Использование семафора для ограничения одновременного доступа к общему ресурсу:
    func semaphoreTest() {
        let semaphore = DispatchSemaphore(value: 1)  // начальное значение 1
        
        DispatchQueue.global().async {
            semaphore.wait()  // уменьшает значение семафора
            // критическая секция
            print("Общий ресурс")
            semaphore.signal()  // увеличивает значение семафора
        }
    }
    
    // Выполнение нескольких асинхронных задач и ожидание их завершения:
    func groupTest() {
        // Создание группы
        let group = DispatchGroup()
        group.enter()
        // someAsyncFunction1() {
        group.leave()
        // }
        
        group.enter()
        // someAsyncFunction2() {
        group.leave()
        // }
        
        group.notify(queue: .main) {
            print("All async tasks have completed")
        }
    }
    
    // Барьер
    func barrierTest() {
        var queue = DispatchQueue(label: "com.example.queue")
        queue.async {
            // data.read()
        }
        queue.async(flags: .barrier) {
            // data.write()
        }
        queue.async {
            // data.read()
        }
    }
    
    // Создание Dispatch Timer
    func timerTest() {
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: .seconds(2))
        timer.setEventHandler {
            print("Timer fired at \(Date())")
        }
        timer.resume()
        timer.cancel()
    }
    
    // Состояние гонки
    func raceСondition() {
        var counter = 0
        let queue = DispatchQueue(label: "com.example.myqueue", attributes: .concurrent)
        
        for _ in 0..<1000 {
            queue.async {
                counter += 1
            }
        }
        
        print(counter)
    }
    
    // Обратное изменение приоритета
    func reversePriority() {
        let highPriority = DispatchQueue.global(qos: .userInitiated)
        let lowPriority = DispatchQueue.global(qos: .utility)
        
        let semaphore = DispatchSemaphore(value: 1)
        
        lowPriority.async {
            semaphore.wait()
            Thread.sleep(forTimeInterval: 2) // Эмуляция затратной операции
            semaphore.signal()
        }
        
        highPriority.async {
            semaphore.wait()
            // Этот блок должен быть выполнен быстро,
            // но он должен ждать, пока низкоприоритетная задача не освободит семафор
            semaphore.signal()
        }
    }
}
