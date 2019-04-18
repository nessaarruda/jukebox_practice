require 'rails_helper'

RSpec.describe 'user login workflow', type: :feature do
  it 'logs in an existing user' do
    user = User.create(username: 'fuzzyduck', password: 'password')

    visit root_path

    click_link 'Log In'
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Log Me In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")

    expect(page).to have_link('Log Out')

    visit root_path

    expect(page).to_not have_link('Log In')
  end
  
  it 'fails with no credentials' do
    visit login_path

    # leave form empty
    click_button 'Log Me In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login credentials were bad or missing")
  end

  it 'fails with bad credentials' do
    user = User.create(username: 'fuzzyduck', password: 'password')

    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: 'bad password'

    click_button 'Log Me In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login credentials were bad or missing")
  end
end
