require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    user = User.create!(first_name: 'John',
                        last_name: 'Doe',
                        email: 'jd@example.com',
                        password: 'password',
                        password_confirmation: 'password')
  end

  scenario "User can log in given they enter valid credentials" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'jd@example.com'
      fill_in id: 'password', with: 'password'
    end
    click_button 'Submit'

    expect(page).to have_content('Welcome John!')
  end

  scenario "User is displayed an error given they enter invalid credentials" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'jd@example.com'
      fill_in id: 'password', with: 'test'
    end
    click_button 'Submit'

    expect(page).to have_content('Username or password incorrect.')
  end

end