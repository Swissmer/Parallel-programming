import Foundation

/*
 NSThread — это класс Objective-C, который предоставляет более высокоуровневый интерфейс для работы с потоками в iOS и macOS.
 */

class NSThread {
    var thread: Thread?
    
    // Тестировние параллелизма
    func createThreadTest() {
        // Пример использования
        let example = NSThread()
        // запуск
        example.startThread()
        
        sleep(2)
        print("основной поток")
        
        // отмена
        example.cancelThread()
    }
    
    // Создание потока
    private func startThread() {
        // Создаем и запускаем новый поток
        thread = Thread(target: self, selector: #selector(threadFunction), object: nil)
        thread?.start()
    }
    
    // Функция, которая будет выполняться в новом потоке
    @objc private func threadFunction() {
        sleep(1)
        print("параллельный поток")
    }
    
    // Функция отмены потока
    private func cancelThread() {
        // Отмена потока
        thread?.cancel()
        thread = nil
    }
}
