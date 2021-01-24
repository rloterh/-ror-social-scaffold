require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'user42', email: 'user42@m.com', password: 'user42123') }

  before do
    Post.create(user_id: user.id, content: 'First Post by User42')
    Post.create(user_id: user.id, content: 'Second Post by User42 ')
    Post.create(user_id: user.id, content: 'Third Post by User42')
  end

  context 'Post Validations, length, presence and order' do
    it {
      expect(subject).to validate_length_of(:content).is_at_most(1000)
        .with_message(/1000 characters in post is the maximum allowed./)
    }
    it {
      expect(subject).to validate_presence_of(:content)
    }
    it { expect(Post.ordered_by_most_recent.first).to eq(Post.last) }
  end

  context 'Post Associations, with comments and likes' do
    it { expect(subject).to belong_to :user }
    it { expect(subject).to have_many(:comments).dependent(:destroy) }
    it { expect(subject).to have_many(:likes).dependent(:destroy) }
  end
end
