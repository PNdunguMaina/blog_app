require_relative '../rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(Title: nil, Text: 'All Divas are welcome') }

  it 'Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should have upto 250 characters' do
    subject.Title = 'a' * 25
    expect(subject.Title.length).to be_between(1, 250)
  end

  it 'Title should not exceed 250 characters' do
    subject.Title = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer' do
    subject.CommentsCounter = 25
    expect(subject.CommentsCounter).to be_kind_of(Numeric)
  end
end
