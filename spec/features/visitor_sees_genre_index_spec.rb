require 'rails_helper'

describe 'visitor sees genre index' do
  it 'sees all genres' do
    genre1 = Genre.create(name: 'Rock')
    genre2 = Genre.create(name: 'Jazz')

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end
end
