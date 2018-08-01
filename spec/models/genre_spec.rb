require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:song_genres)}
    it {should have_many(:songs)}
  end

  describe 'instance methods' do
    it 'should give average rating for all songs in current genre' do
      genre = Genre.create(name: 'Rock')
      artist = Artist.create(name: 'artist')
      song1 = genre.songs.create(title: 'song1', length: 100, play_count: 100, rating: 5, artist_id: artist.id)
      song2 = genre.songs.create(title: 'song2', length: 100, play_count: 100, rating: 3, artist_id: artist.id)

      result = 4

      expect(genre.avg_rating).to eq(result)
    end
  end
end
