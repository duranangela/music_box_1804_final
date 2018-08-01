require 'rails_helper'

describe 'genre index' do
  describe 'as a visitor' do
    it 'sees all genres' do
      genre1 = Genre.create(name: 'Rock')
      genre2 = Genre.create(name: 'Jazz')

      visit genres_path

      expect(page).to have_link(genre1.name)
      expect(page).to have_link(genre2.name)

      click_on genre1.name

      expect(current_path).to eq(genre_path(genre1))
    end
    it 'can not create new genre' do
      genre1 = Genre.create(name: 'Rock')
      genre2 = Genre.create(name: 'Jazz')

      visit genres_path

      expect(page).to_not have_content('Create a new Genre')

      #I have no idea how to test this
      # visit '/admin/genres/create'
      #
      # expect(page).to have_content("The page you were looking for doesn't exist")
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
