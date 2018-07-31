require 'rails_helper'

describe 'visitor sees genre show page' do
  it 'sees all songs associated with genre' do
    genre = Genre.create(name: 'Rock')
    artist = Artist.create(name: 'artist')
    song1 = genre.songs.create(title: 'song1', length: 100, play_count: 100, rating: 5, artist_id: artist.id)
    song2 = genre.songs.create(title: 'song2', length: 100, play_count: 100, rating: 3, artist_id: artist.id)
    song3 = artist.songs.create(title: 'song3', length: 100, play_count: 100, rating: 4)

    visit genre_path(genre)

    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
    expect(page).to_not have_content(song3.title)
  end
  it 'sees average rating for all songs in this genre' do
    genre = Genre.create(name: 'Rock')
    artist = Artist.create(name: 'artist')
    song1 = genre.songs.create(title: 'song1', length: 100, play_count: 100, rating: 5, artist_id: artist.id)
    song2 = genre.songs.create(title: 'song2', length: 100, play_count: 100, rating: 3, artist_id: artist.id)
    song3 = artist.songs.create(title: 'song3', length: 100, play_count: 100, rating: 1)

    visit genre_path(genre)

    expect(page).to have_content('Average rating: 4')
  end

end
