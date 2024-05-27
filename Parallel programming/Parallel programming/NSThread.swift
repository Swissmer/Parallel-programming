import Foundation

/*
 NSThread — это класс Objective-C, который предоставляет более высокоуровневый интерфейс для работы с потоками в iOS и macOS. 
 */

//class NSThread {
//    var thread: Thread?
//
//    func startThread() {
//        // Создаем и запускаем новый поток
//        thread = Thread(target: self, selector: #selector(threadFunction), object: nil)
//        thread?.start()
//    }
//
//    @objc func threadFunction() {
//        print("параллельный поток")
//    }
//
//    func cancelThread() {
//        // Отмена потока
//        thread?.cancel()
//        thread = nil
//    }
//}

//// Пример использования
//let example = NSThread()
//// запуск
//example.startThread()
//
//sleep(1)
//print("основной поток")
//
//// отмена
//example.cancelThread()
