require 'rails_helper'

RSpec.describe 'user creates a new song under artist-songs', type: :feature do
  it "can create a new song" do
    artist = Artist.create(name: 'This Must be the Band')
    title = 'Psycho Killer'
    length = 345
    play_count = 3

    visit new_artist_song_path(artist)

    fill_in :song_title, with: title
    fill_in :song_length, with: length
    fill_in :song_play_count, with: play_count

    click_on 'Create Song'

    new_song = Song.last

    expect(current_path).to eq(song_path(new_song))
  end

  it 'cannot create a song if details are missing' do
    artist = Artist.create(name: 'This Must be the Band')

    visit new_artist_song_path(artist)
    click_on 'Create Song'

    expect(current_path).to eq(artist_songs_path(artist))
    within '#errors' do
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content('Length is not a number')
      expect(page).to have_content("Length can't be blank")
    end
  end
end
