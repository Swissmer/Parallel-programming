import Foundation

/*
 Grand Central Dispatch (GCD) — это низкоуровневая библиотека, разработанная Apple, позволяющая управлять параллельными задачами в многопоточном окружении.
 */

// Обновление пользовательского интерфейса - в главном потоке

// Основная очередь
/// Выполняется в основном потоке
//let mainQueue = DispatchQueue.main

// Глобальная очередь
/// Выполняется в фоновом режиме
//let globalQueue = DispatchQueue.main

// Пользовательская очередь
/// Пользователь задаёт свои собственные очереди
//let customQueue = DispatchQueue(label: "com.example.queue")

// возвращают управление на текущую очередь
//globalQueue.async {
//    print("выполняем асинхронную задачу")
//}

// не возвращают управление, пока не завершиться задача
//globalQueue.async {
//    print("выполняем синхронную задачу")
//}

// Выполение задачи после задержки
//DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//    print("выполнено с задержкой")
//})

////Выполнение нескольких асинхронных задач и ожидание их завершения:
//let group = DispatchGroup()
//
//group.enter()
//someAsyncFunction1() {
//    group.leave()
//}
//
//group.enter()
//someAsyncFunction2() {
//    group.leave()
//}
//
//group.notify(queue: .main) {
//    print("All async tasks have completed")
//}



//// Использование семафора для ограничения одновременного доступа к общему ресурсу:
//
//let semaphore = DispatchSemaphore(value: 1)  // начальное значение 1
//var data = SharedResource()
//
//DispatchQueue.global().async {
//    semaphore.wait()  // уменьшает значение семафора
//    // критическая секция
//    data.modify()
//    semaphore.signal()  // увеличивает значение семафора
//}

//
// Барьеры //
//

//queue.async {
//    data.read()
//}
//
//queue.async(flags: .barrier) {
//    data.write()
//}
//
//queue.async {
//    data.read()
//}

//
// Таймеры
//

// Пример таймера, который выполняет блок кода каждые две секунды:

// Создание Dispatch Timer
//let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())

// Настройка таймера на повтор каждые две секунды
//timer.schedule(deadline: .now(), repeating: .seconds(2))

// Установка обработчика события
//timer.setEventHandler {
//    print("Timer fired at \(Date())")
//}

// Запуск таймера
//timer.resume()

// Если вы хотите остановить таймер, вы можете сделать это, вызвав метод cancel():

//timer.cancel()

//
// Состояние гонки
//

//var counter = 0
//let queue = DispatchQueue(label: "com.example.myqueue", attributes: .concurrent)
//
//for _ in 0..<1000 {
//    queue.async {
//        counter += 1
//    }
//}
//
//print(counter)
/*
 Из-за конкуренции между потоками, точное значение counter может
 быть меньше 1000 из-за потери или перекрытия инкрементов.
 Операция counter += 1 является атомарной и гарантирует увеличение его на 1,
 поэтому число не может стать отрицательным.
 */

// Обратное изменение приоритета

//let highPriority = DispatchQueue.global(qos: .userInitiated)
//let lowPriority = DispatchQueue.global(qos: .utility)
//
//let semaphore = DispatchSemaphore(value: 1)
//
//lowPriority.async {
//    semaphore.wait()
//    Thread.sleep(forTimeInterval: 2) // Эмуляция затратной операции
//    semaphore.signal()
//}
//
//highPriority.async {
//    semaphore.wait()
//    // Этот блок должен быть выполнен быстро,
//    // но он должен ждать, пока низкоприоритетная задача не освободит семафор
//    semaphore.signal()
//}
