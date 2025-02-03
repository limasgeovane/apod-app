//
//  FavoriteApodsRepository.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

protocol FavoriteApodsRepositoryLogic {
    func favorite(favoriteApod: FavoriteApod)
    func getFavorites() -> [FavoriteApod]
    func unfavorite(favoriteApod: FavoriteApod)
    func isApodFavorite(date: String) -> Bool
}

class FavoriteApodsRepository: FavoriteApodsRepositoryLogic {
    private let favoritesKey = "FavoriteApods"
    
    func favorite(favoriteApod: FavoriteApod) {
        var favorites = getFavorites()
        
        favorites.append(favoriteApod)
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Erro ao codificar FavoriteApods: \(error)")
        }
    }
    
    func getFavorites() -> [FavoriteApod] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else {
            return []
        }
        
        let decoder = JSONDecoder()
        do {
            let favorites = try decoder.decode([FavoriteApod].self, from: data)
            return favorites
        } catch {
            return []
        }
    }
    
    func unfavorite(favoriteApod: FavoriteApod) {
        var favorites = getFavorites()
        
        favorites.removeAll { existingFavorite in
            return existingFavorite == favoriteApod
        }
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Erro ao codificar FavoriteApods após remoção: \(error)")
        }
    }
    
    func isApodFavorite(date: String) -> Bool {
        return getFavorites().contains {
            $0.date == date
        }
    }
}
