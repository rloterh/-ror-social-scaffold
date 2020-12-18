require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Comments Validations, Maximum size, length and presence' do
    let(:user) { User.create(name: 'user41', email: 'user41@gmail.com', password: 'user41123') }
    let(:post) { Post.create(user_id: user.id, content: 'Post from user41') }

    subject { post.comments.build(user_id: user.id, content: 'New post by user41') }

    it 'Maximun size of content is 200' do
      expect(subject).to be_valid
    end

    it { expect(subject).to validate_presence_of(:content) }

    it {
      expect(subject).to validate_length_of(:content).is_at_most(200)
        .with_message(/200 characters in comment is the maximum allowed./)
    }
  end

  context 'Association' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to belong_to(:post) }
  end
end