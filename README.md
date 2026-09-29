# 🎬 MovieApp

A native iOS app for discovering movies, built with **Swift** and **SwiftUI**. Browse trending and popular titles, view detailed movie information, and watch trailers — all in one place.

Built as a weekend learning project to get hands-on with iOS development, using resources from **freeCodeCamp**.

---

## ✨ Features

- Browse trending / popular movies
- View detailed movie info (overview, rating, release date, genres, poster)
- Watch official trailers via embedded YouTube playback
- Search for movies by title
- Smooth, native SwiftUI navigation and UI

---

## 🛠 Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Architecture:** MVVM
- **APIs:**
  - [TMDB API](https://developer.themoviedb.org/docs) — movie data, posters, metadata
  - [YouTube Data API](https://developers.google.com/youtube/v3) — trailer search & playback
- **Networking:** URLSession + Codable for JSON decoding
- **Concurrency:** Swift async/await

---

## 📱 Screenshots

| Home | Details | Trailer |
|------|---------|---------|
| _add screenshot_ | _add screenshot_ | _add screenshot_ |

---

## 🚀 Getting Started

### Prerequisites

- Xcode 15+
- iOS 16+ target device or simulator
- A [TMDB API key](https://www.themoviedb.org/settings/api)
- A [YouTube Data API v3 key](https://console.cloud.google.com/apis/library/youtube.googleapis.com)

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/<your-username>/MovieApp.git
   cd MovieApp
   ```

2. Add your API keys.
   Create a file named `Secrets.swift` in the project (and add it to `.gitignore`):
   ```swift
   enum Secrets {
       static let tmdbAPIKey = "YOUR_TMDB_API_KEY"
       static let youtubeAPIKey = "YOUR_YOUTUBE_API_KEY"
   }
   ```

3. Open `MovieApp.xcodeproj` (or `.xcworkspace`) in Xcode.

4. Build and run on a simulator or device (`Cmd + R`).

---

## 📂 Project Structure

```
MovieApp/
├── Models/          # Codable models for movies, trailers, etc.
├── Views/           # SwiftUI views (Home, Detail, Search, Player)
├── ViewModels/       # MVVM view models handling state & API calls
├── Networking/       # API clients for TMDB and YouTube
├── Resources/        # Assets, colors, fonts
└── Secrets.swift     # API keys (not committed)
```

---

## ⚠️ API Usage Notes

- **TMDB** has generous rate limits, but responses should be cached locally to avoid redundant calls.
- **YouTube Data API** has a daily quota (10,000 units by default) — searching for a trailer costs 100 units per call, so trailer video IDs are cached per movie rather than re-fetched on every view.

---

## 🗺 Roadmap

- [ ] Add local caching layer (e.g. `URLCache` or a lightweight persistence store)
- [ ] Add favorites / watchlist functionality
- [ ] Add offline support
- [ ] Improve error handling and loading states
- [ ] Add unit tests for ViewModels and networking layer

---

## 🙏 Acknowledgements

- [freeCodeCamp](https://www.freecodecamp.org/) — for the learning resources that made this project possible
- [TMDB](https://www.themoviedb.org/) — movie data and this product uses the TMDB API but is not endorsed or certified by TMDB
- [YouTube Data API](https://developers.google.com/youtube/v3) — trailer integration

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Vannovich**
Software Developer | Data Science Graduate Student, University of Buea
