require_relative '../rails_helper'
RSpec.describe Like, type: :model do
  subject { Like.new }

  it 'creates a Like object at an instance of Like model' do
    expect(subject).to be_an_instance_of Like
  end
end
