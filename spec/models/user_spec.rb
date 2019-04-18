require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :username }
  end

  describe 'roles' do
    it 'can create and test an admin user' do
    end
    it 'can create and test an regular user' do
    end
  end
end
