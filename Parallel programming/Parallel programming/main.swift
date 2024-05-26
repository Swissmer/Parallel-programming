import Foundation

// Обновление пользовательского интерфейса - в главном потоке

// Основная очередь
/// Выполняется в основном потоке
let mainQueue = DispatchQueue.main

// Глобальная очередь
/// Выполняется в фоновом режиме
let globalQueue = DispatchQueue.main

// Пользовательская очередь
/// Пользователь задаёт свои собственные очереди
let customQueue = DispatchQueue(label: "com.example.queue")

// возвращают управление на текущую очередь
globalQueue.async {
    print("выполняем асинхронную задачу")
}

// не возвращают управление, пока не завершиться задача
globalQueue.async {
    print("выполняем синхронную задачу")
}

// Выполение задачи после задержки
DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
    print("выполнено с задержкой")
})

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
