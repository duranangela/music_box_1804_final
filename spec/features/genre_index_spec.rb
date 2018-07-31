require 'rails_helper'

describe 'genre index' do
  describe 'as a visitor' do
    it 'sees all genres' do
      genre1 = Genre.create(name: 'Rock')
      genre2 = Genre.create(name: 'Jazz')

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
  end
  describe 'as an admin' do
    it 'sees all genre and can create new genre' do
      admin = User.create(username: 'bob', password: '12345', role: 1)
      genre1 = Genre.create(name: 'Rock')
      genre2 = Genre.create(name: 'Jazz')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      name = 'Dance'

      visit genres_path

      fill_in :genre_name, with: name
      click_on 'Create Genre'

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content(name)
    end
  end
end
