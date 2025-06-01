require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject(:invalid_user) { User.new }
    subject(:valid_user) { User.new(first_name: 'test', last_name: 'test') }
    it 'requires first_name to be set' do
      expect(invalid_user.valid?).to_not be
      expect(invalid_user.errors[:first_name]).not_to be_empty
      expect(valid_user.valid?).to be true
      expect(valid_user.errors[:first_name]).to be_empty
    end
    it 'requires last_name to be set' do
      expect(invalid_user.valid?).to be false
      expect(invalid_user.errors[:last_name]).not_to be_empty
      expect(valid_user.valid?).to be true
      expect(valid_user.errors[:last_name]).to be_empty
    end
  end
end
