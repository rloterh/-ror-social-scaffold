require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'ValidCredential' do
    sign_up_with 'user40', 'user40@m.com', 'user40123', 'user40123'

    expect(page).to have_content('Timeline')
  end

  scenario 'InvalidEmail' do
    sign_up_with 'user40', 'invalid_email', 'user40123', 'user40123'

    expect(page).to have_content('Sign in')
  end

  scenario 'BlankPassword' do
    sign_up_with 'user40123', 'user40@m.com', '', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(name, email, password, password_confirmation)
    visit 'users/sign_up'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password', with: password_confirmation
    click_button 'Sign up'
  end
end
