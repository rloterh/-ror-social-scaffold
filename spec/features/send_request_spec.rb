require 'rails_helper'

feature 'SendRequest' do
  scenario 'Signup Users | Make Request' do
    sign_up_and_request

    expect(page).to have_content 'Request is Pending'
  end

  scenario 'Check Pending Request' do
    signup_user2_and_check_pending

    within('div#pending_friends') do
      expect(page).to have_content 'user22'
    end
  end

  def sign_up_and_request
    visit 'users/sign_up'
    fill_in :user_name, with: 'user22'
    fill_in :user_email, with: 'user22@m.com'
    fill_in :user_password, with: 'user22_123'
    fill_in :user_password_confirmation, with: 'user22_123'
    click_on 'Sign up'
    visit '/'
    click_on 'Sign out'
    visit 'sign_up'
    fill_in :user_name, with: 'user24'
    fill_in :user_email, with: 'user24@m.com'
    fill_in :user_password, with: 'user24_123'
    fill_in :user_password_confirmation, with: 'user24_123'
    click_on 'Sign up'
    visit 'users/'
    click_on 'Send Request'
  end

  def signup_user2_and_check_pending
    visit 'users/sign_up'
    fill_in :user_name, with: 'user22'
    fill_in :user_email, with: 'user22@m.com'
    fill_in :user_password, with: 'user22_123'
    fill_in :user_password_confirmation, with: 'user22_123'
    click_on 'Sign up'
    visit 'users/'
    click_on 'Sign out'
    visit 'sign_up'
    fill_in :user_name, with: 'user24'
    fill_in :user_email, with: 'user24@m.com'
    fill_in :user_password, with: 'user24_123'
    fill_in :user_password_confirmation, with: 'user24_123'
    click_on 'Sign up'
    visit 'users/'
    click_on 'Send Request'
    visit 'friendships/'
  end
end
