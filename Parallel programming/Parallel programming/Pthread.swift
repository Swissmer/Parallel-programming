import Foundation

/*
 POSIX Threads (pthread) — это стандартный интерфейс для работы с потоками в операционных системах UNIX.
 */

// Переменная для хранения идентификатора потока
//var thread: pthread_t?
//
//// Функция, которая будет выполняться в новом потоке
//func threadFunction(arg: UnsafeMutableRawPointer?) -> UnsafeMutableRawPointer? {
//    // Код, выполняемый в новом потоке
//    sleep(2)
//    print("параллельный поток")
//    return nil
//}
//
//// Функция для запуска нового потока
//func startThread() {
//    // Инициализация потока
//    let result = pthread_create(&thread, nil, { (arg) -> UnsafeMutableRawPointer? in
//        return threadFunction(arg: arg)
//    }, nil)
//    // Проверка на успешность создания потока
//    if result != 0 {
//        print("Ошибка при создании потока: \(result)")
//    }
//}
//
//// Функция для ожидания завершения потока
//func joinThread() {
//    // Проверка, что переменная thread не nil
//    if let thread = thread {
//        let result = pthread_join(thread, nil)
//        
//        // Проверка на успешность завершения потока
//        if result != 0 {
//            print("Ошибка при ожидании завершения потока: \(result)")
//        }
//    } else {
//        print("Нет активного потока для ожидания")
//    }
//}

// Запуск нового потока
//startThread()

// Ожидание завершения потока
//joinThread()
