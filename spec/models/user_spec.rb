require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it do
      should validate_presence_of(:username)
      should validate_presence_of(:password)
      should validate_presence_of(:password_confirmation)
      should validate_uniqueness_of(:username)
    end
  end
end
