require 'rails_helper'

describe "User can create a new song" do
  it "by filling out a form" do
    artist = Artist.create(name: 'Wild Cherry')
    song_title = "Play that Funky Music"
    song_length = 267
    song_play_count = 340000
    rating = 4

    visit new_artist_song_path(artist)

    fill_in :song_title, with: song_title
    fill_in :song_length, with: song_length
    fill_in :song_play_count, with: song_play_count
    fill_in :song_rating, with: rating

    click_on 'Create Song'

    expect(current_path).to eq(songs_path)
    expect(page).to have_content(song_title)
  end
    it 'cannot assign a rating above 5' do
      artist = Artist.create(name: 'Wild Cherry')
      song_title = "Play that Funky Music"
      song_length = 267
      song_play_count = 340000
      rating = 6

      visit new_artist_song_path(artist)

      fill_in :song_title, with: song_title
      fill_in :song_length, with: song_length
      fill_in :song_play_count, with: song_play_count
      fill_in :song_rating, with: rating

      click_on 'Create Song'

      expect(page).to have_content("Rating must be between 1-5")
    end
end
