# Movie App

A Flutter application that fetches movie data from a public API and utilizes the Provider package for state management.

## Overview

This Movie App allows users to browse and view details of various movies, and also provides the functionality to search for specific movies. It demonstrates a clean architecture by separating the UI, business logic, and data fetching layers. Provider is used to efficiently manage the application's state and make data accessible across different widgets.

## Features

* **Browse Movies:** Displays a list of popular or trending movies.
* **Movie Details:** Shows detailed information about a selected movie, including title, overview, release date, rating, and poster.
* **Search Movies:** Allows users to search for specific movies by title.
* **Asynchronous Data Fetching:** Fetches movie data from a remote API.
* **State Management with Provider:** Implements Provider for managing the application's state, ensuring efficient data sharing and UI updates.
* **Clean Architecture:** Separates concerns for better maintainability and testability.
* **Splash Screen Animation:** Engaging splash screen animation using Lottie.

## Screenshots
<img src="https://github.com/user-attachments/assets/3777f496-9492-4ed3-b83f-4ef2b160c428" data-canonical-src="https://github.com/user-attachments/assets/3777f496-9492-4ed3-b83f-4ef2b160c428" width="200" height="340" />
<img src="https://github.com/user-attachments/assets/9b8d2cc1-994d-4bb5-b413-7e50c5f0576a" data-canonical-src="https://github.com/user-attachments/assets/9b8d2cc1-994d-4bb5-b413-7e50c5f0576a" width="200" height="340" />
<img src="https://github.com/user-attachments/assets/a60cff8d-7bf7-4d96-9185-6335d5baf8b7" data-canonical-src="https://github.com/user-attachments/assets/a60cff8d-7bf7-4d96-9185-6335d5baf8b7" width="200" height="340" />

## Technologies Used

* **Flutter:** UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
* **Dart:** The programming language for Flutter.
* **Provider:** A popular Flutter package for simple and scalable state management.
* **HTTP Package (`http`):** For making network requests to the movie API.
* **Lottie (`lottie`):** For displaying vector-based animations.
* **Cached Network Image (`cached_network_image`):** For efficient loading and caching of movie posters.

## API Used

* The Movie Database (TMDb) API - https://api.tvmaze.com/search/shows?q=all

## State Management with Provider

This application utilizes the Provider package for state management. The `MovieProvider` class is responsible for:

* Fetching lists of popular/trending movies from the `MovieApiService`.
* Fetching details for a specific movie.
* Handling movie search requests and fetching the search results.
* Holding the state of the movie data (e.g., lists of movies, details of a movie, search results, loading states, error states).
* Notifying listeners (widgets) when the state changes, triggering UI updates.

Widgets consume the data provided by the `MovieProvider` using `Provider.of<MovieProvider>(context)` or `Consumer` widgets. For example, the `MovieListScreen` and the `MovieDetailScreen` would listen to different parts of the `MovieProvider`'s state. The search functionality would likely involve a `TextField` that updates a search query in the `MovieProvider`, which then triggers an API call and updates the search results.

## Contributing

Contributions to this project are welcome. If you find any bugs or have suggestions for improvements, please feel free to open an issue or submit a pull request.
