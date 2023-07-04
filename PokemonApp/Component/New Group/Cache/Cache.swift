//
//  Cache.swift
//  PokemonApp
//
//  Created by Prizega  on 18/06/23.
//

import Foundation

final class Cache<Key: Hashable, Value> {
    private let wrapped = NSCache<WrappedKey, Entry>()
    private let dateProvider: () -> Date
    private let entryLifetime: TimeInterval
    private let keyTracker = KeyTracker()
    
    init(dateProvider: @escaping () -> Date = Date.init,
         entryLifetime: TimeInterval = 12 * 60 * 60) {
        self.dateProvider = dateProvider
        self.entryLifetime = entryLifetime
        wrapped.delegate = keyTracker
    }
    
    func insert(_ value: Value, forKey key: Key) {
        let date = dateProvider().addingTimeInterval(entryLifetime)
        let entry = Entry(key: key, value: value, expirationDate: date)
        wrapped.setObject(entry, forKey: WrappedKey(key))
        keyTracker.keys.insert(key)
    }
    
    func value(forKey key: Key) -> Value? {
        guard let entry = wrapped.object(forKey: WrappedKey(key)) else {
            return nil
        }
        
        guard dateProvider() < entry.expirationDate else {
            removeValue(forKey: key)
            return nil
        }
        return entry.value
    }
    
    func removeValue(forKey key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
    
    func removeAllObjects() {
        wrapped.removeAllObjects()
    }
}


private extension Cache {
    final class WrappedKey: NSObject {
        let key: Key
        
        init(_ key: Key) { self.key = key }
        
        override var hash: Int { return key.hashValue }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }
            
            return value.key == key
        }
    }
    
    final class Entry {
        let key: Key
        let value: Value
        let expirationDate: Date
        
        init(key: Key, value: Value, expirationDate: Date) {
            self.value = value
            self.expirationDate = expirationDate
            self.key = key
        }
    }
    
    final class KeyTracker: NSObject, NSCacheDelegate {
        var keys = Set<Key>()
        
        func cache(_ cache: NSCache<AnyObject, AnyObject>,
                   willEvictObject object: Any) {
            guard let entry = object as? Entry else { return }
            keys.remove(entry.key)
        }
    }
    
    func entry(forKey key: Key) -> Entry? {
        guard let entry = wrapped.object(forKey: WrappedKey(key)) else { return nil }
        guard dateProvider() < entry.expirationDate else {
            removeValue(forKey: key)
            return nil
        }
        return entry
    }
    
    func insert(_ entry: Entry) {
        wrapped.setObject(entry, forKey: WrappedKey(entry.key))
        keyTracker.keys.insert(entry.key)
    }
}

extension Cache: Codable where Key: Codable, Value: Codable {
    convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.singleValueContainer()
        let entries = try container.decode([Entry].self)
        entries.forEach(insert)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(keyTracker.keys.compactMap(entry))
    }
}

extension Cache where Key: Codable, Value: Codable {
    func saveToDisk(
        withName name: String,
        using fileManager: FileManager = .default
    ) throws {
        let folderURLs = fileManager.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        )
        
        let fileURL = folderURLs[0].appendingPathComponent(name + ".cache")
        let data = try JSONEncoder().encode(self)
        try data.write(to: fileURL)
        print("data successfully written to FileManager")
    }
}

extension Cache {
    subscript(key: Key) -> Value? {
        get { return value(forKey: key) }
        set {
            guard let value = newValue else {
                removeValue(forKey: key)
                return
            }
            insert(value, forKey: key)
        }
    }
}

extension Cache.Entry: Codable where Key: Codable, Value: Codable {}


class PublicCache {
    static let shared = PublicCache()
    let PokemonData = Cache<String, [PokemonCatchModel]>()
    
}

enum CacheKey: String {
    case myPokemon
    
    func key() -> String {
        return self.rawValue
    }
    
    func path() -> URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent(self.key() + ".cache")
    }
    
    func getData() -> Data? {
        try? Data(contentsOf: path())
    }
}







//final class commonCache<Key: Hashable, Value> {
//    private var cache = [Key: Value]()
//    private let lock = NSLock()
//
//    func setObject(_ object: Value, forKey key: Key) {
//        lock.lock()
//        cache[key] = object
//        lock.unlock()
//    }
//
//    func object(forKey key: Key) -> Value? {
//        lock.lock()
//        let object = cache[key]
//        lock.unlock()
//        return object
//    }
//
//    func removeObject(forKey key: Key) {
//        lock.lock()
//        cache.removeValue(forKey: key)
//        lock.unlock()
//    }
//}

// To Implement :

/*
 1. to cache
 
 let cache = ArrayCache<String, YourEntityType>()
 
 Replace String with the key type you want to use (e.g., Int, UUID, etc.), and replace YourEntityType with the type of entity you want to cache.
 
 2. to Store Cache

 let entityArray = [YourEntityType]()
 let key = "uniqueKey"
 cache.setArray(entityArray, forKey: key)
 
 Replace "uniqueKey" with a unique identifier for your array of entities.
 
 3.Retrieve the array of entities from the cache:
 
 if let cachedArray = cache.getArray(forKey: key) {
     // Use the cached array
 } else {
     // Array not found in the cache
 }
 
 4. Remove an array of entities from the cache (optional)
 
 cache.removeArray(forKey: key)
 
 Replace key with the key of the array you want to remove from the cache.
 
 
 5. Example :
 
 // Create an instance of the cache
 let cache = ArrayCache<String, [Int]>()

 // Store an array in the cache
 let array = [1, 2, 3, 4, 5]
 let key = "myArray"
 cache.setArray(array, forKey: key)

 // Retrieve the array from the cache
 if let cachedArray = cache.getArray(forKey: key) {
     print(cachedArray) // [1, 2, 3, 4, 5]
 }

 // Remove the array from the cache
 cache.removeArray(forKey: key)
 
 
 */
