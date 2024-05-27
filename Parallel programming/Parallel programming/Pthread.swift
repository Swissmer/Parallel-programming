import Foundation

/*
 POSIX Threads (pthread) — это стандартный интерфейс для работы с потоками в операционных системах UNIX.
 */

class Pthread {
    // Переменная для хранения идентификатора потока
    var thread: pthread_t?
    
    // Тестировние параллелизма
    func createThreadTest() {
        // Запуск нового потока
        startThread()
        
        print("основной поток")
        // Ожидание завершения потока
        joinThread()
    }
    
    // Функция, которая будет выполняться в новом потоке
    private func threadFunction(arg: UnsafeMutableRawPointer?) -> UnsafeMutableRawPointer? {
        // Код, выполняемый в новом потоке
        sleep(2)
        print("параллельный поток")
        return nil
    }
    
    // Функция для запуска нового потока
    private func startThread() {
        // Инициализация потока
        let result = pthread_create(&thread, nil, { (arg) -> UnsafeMutableRawPointer? in
            return Pthread().threadFunction(arg: arg)
        }, nil)
        // Проверка на успешность создания потока
        if result != 0 {
            print("Ошибка при создании потока: \(result)")
        }
    }
    
    // Функция для ожидания завершения потока
    private func joinThread() {
        // Проверка, что переменная thread не nil
        if let thread = thread {
            let result = pthread_join(thread, nil)
            
            // Проверка на успешность завершения потока
            if result != 0 {
                print("Ошибка при ожидании завершения потока: \(result)")
            }
        } else {
            print("Нет активного потока для ожидания")
        }
    }
}
