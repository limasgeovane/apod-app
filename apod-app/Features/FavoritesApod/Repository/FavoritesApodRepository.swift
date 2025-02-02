//
//  FavoritesApodRepository.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

protocol FavoritesApodRepositoryLogic {
    func saveFavorite(favoriteApod: FavoriteApod)
    func getFavorites() -> [FavoriteApod]
    func removeFavorite(favoriteApod: FavoriteApod)
    func isApodFavorite(date: String) -> Bool
}

class FavoritesApodRepository: FavoritesApodRepositoryLogic {
    private let favoritesKey = "favoritesApod"
    
    func saveFavorite(favoriteApod: FavoriteApod) {
        var favorites = getFavorites()
        
        favorites.append(favoriteApod)
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Erro ao codificar FavoritesApod: \(error)")
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
            print("Erro ao decodificar a lista de favoritos: \(error)")
            return []
        }
    }
    
    func removeFavorite(favoriteApod: FavoriteApod) {
        var favorites = getFavorites()
        
        favorites.removeAll { existingFavorite in
            return existingFavorite == favoriteApod
        }
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Erro ao codificar FavoritesApod após remoção: \(error)")
        }
    }
    
    func isApodFavorite(date: String) -> Bool {
        return getFavorites().contains {
            $0.date == date
        }
    }
}
