# 🎶 Music Genius
Music Genius is a Ruby on Rails application that allows users to explore a comprehensive music database. Users can view details about artists, tracks, and genres, powered by the Last.fm API. This application provides an easy-to-use interface to browse and discover new music, view track details, and explore music genres.

## 🛠 Features
- **Artist Browsing**: View artist profiles, including their name, play count, listener count, and other details.
- **Track Discovery**: Browse tracks associated with each artist, including track name, duration, and links to additional information.
- **Genre Exploration**: Explore a variety of genres and view associated artists and tracks.

## 📂 Project Structure
- **Controllers**: Handles HTTP requests and responses for artists, tracks, and genres.
  - `ArtistsController`: Manages artist-related actions.
  - `TracksController`: Manages track-related actions and associations.
  - `GenresController`: Manages genre information and associations.
- **Models**:
  - `Artist`: Represents a music artist.
  - `Track`: Represents a music track and includes references to both `Artist` and `Genre`.
  - `Genre`: Represents a genre category and its related tracks.

## Prerequisites

Before running the project, ensure you have the following installed:

- **Ruby** 
- **Rails** 

## Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/jwu7-bot/Music_Genius.git
```

### 2. Install project dependencies
Navigate to the project directory and install all required gems:

```bash
cd music_genius
bundle install
```

### 3. Migrate the database
Run the following commands to set up the database and apply any migrations:

```bash
rails db:migrate  
rails db:seed
```

### 4. Run the Rails server
Start the Rails development server:

```bash
rails server
```

