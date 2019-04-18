require 'rails_helper'

RSpec.describe 'user logout workflow', type: :feature do
  it 'logs out the user' do
    user = User.create(username: 'fuzzyduck', password: 'password')

    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Log Me In'
    expect(page).to_not have_link('Log In')
    expect(current_path).to eq(user_path(user))

    click_link('Log Out')
    expect(current_path).to eq(root_path)

    expect(page).to have_link('Log In')
  end
end
