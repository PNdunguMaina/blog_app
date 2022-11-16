require_relative '../rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(Name: 'John Doe', Photo: 'https://github.com/PNdunguMaina', Bio: 'Hardworking man') }
  before { subject.save }

  it 'Name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero' do
    subject.PostsCounter = 15
    expect(subject).to be_valid
  end
end
