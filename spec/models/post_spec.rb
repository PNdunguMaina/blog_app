require_relative '../rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'Divas night', Text: 'All Divas are welcome') }

  it 'Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not be too long' do
    subject.Title = 'a' * 251
    expect(subject).to_not be_valid
  end
end
