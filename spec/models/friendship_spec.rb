require 'rails_helper'

RSpec.describe User, type: :model do
  scenario 'No friend_id' do
    expect(Friendship.new(user_id: 1, status: 'pending').valid?).not_to be true
  end
  scenario 'No user_id' do
    expect(Friendship.new(friend_id: 1, status: 'pending').valid?).not_to be true
  end
  scenario 'No status' do
    expect(Friendship.new(user_id: 1, friend_id: 2).valid?).to be false
  end
end
