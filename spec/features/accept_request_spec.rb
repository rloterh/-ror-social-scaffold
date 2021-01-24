require 'rails_helper'

feature 'AcceptRequest' do
  scenario 'Signup Users | Make Request' do
    sign_up_and_request

    within('div#friend_requests') do
      expect(page).to have_content 'Accept Request'
    end
  end

  scenario 'Accept Freind Request | Appear on Friends List' do
    signup_user2_and_accept

    within('div#friend_list') do
      expect(page).to have_content 'user20'
    end
  end

  def sign_up_and_request
    visit 'users/sign_up'
    fill_in :user_name, with: 'user18'
    fill_in :user_email, with: 'user18@m.com'
    fill_in :user_password, with: 'user18_123'
    fill_in :user_password_confirmation, with: 'user18_123'
    click_on 'Sign up'
    visit '/'
    click_on 'Sign out'
    visit 'sign_up'
    fill_in :user_name, with: 'user20'
    fill_in :user_email, with: 'user20@m.com'
    fill_in :user_password, with: 'user20_123'
    fill_in :user_password_confirmation, with: 'user20_123'
    click_on 'Sign up'
    visit 'users/'
    click_on 'Send Request'
    click_on 'Sign out'
    visit 'sign_in'
    fill_in :user_email, with: 'user18@m.com'
    fill_in :user_password, with: 'user18_123'
    click_on 'Log in'
    visit 'friendships'
  end

  def signup_user2_and_accept
    visit 'users/sign_up'
    fill_in :user_name, with: 'user18'
    fill_in :user_email, with: 'user18@m.com'
    fill_in :user_password, with: 'user18_123'
    fill_in :user_password_confirmation, with: 'user18_123'
    click_on 'Sign up'
    visit 'users/'
    click_on 'Sign out'
    visit 'sign_up'
    fill_in :user_name, with: 'user20'
    fill_in :user_email, with: 'user20@m.com'
    fill_in :user_password, with: 'user20_123'
    fill_in :user_password_confirmation, with: 'user20_123'
    click_on 'Sign up'
    visit '/users/'
    click_on 'Send Request'
    click_on 'Sign out'
    visit 'sign_in'
    fill_in :user_email, with: 'user18@m.com'
    fill_in :user_password, with: 'user18_123'
    click_on 'Log in'
    visit 'friendships/'
    click_on 'Accept Request'
    visit 'friendships/'
  end
end
