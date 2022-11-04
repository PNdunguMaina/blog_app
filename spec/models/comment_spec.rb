require_relative '../rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(Text: 'I will certainly attend') }

  it 'subject should not be too short' do
    subject.Text = 'a'
    expect(subject).to_not be_valid
  end
end
