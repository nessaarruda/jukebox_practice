require 'rails_helper'

RSpec.describe 'user can save an order', type: :feature do
  it 'creates an order in the database' do
    user = User.create!(username: 'papa smurf', password: 'password', role: 0)
    artist = Artist.create!(name: 'Talking Heads')
    song = artist.songs.create!(title: 'Heaven', length: 250, play_count: 13)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit songs_path

    within("#song-#{song.id}") do
      click_button 'Add Song'
    end

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    within("#song-#{song.id}") do
      click_button 'Add Song'
    end

    click_button 'Create Order'

    order = Order.last

    expect(order.user).to eq(user)
    expect(page).to have_content('Cart: 0')
  end
end
