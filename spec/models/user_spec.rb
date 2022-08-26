require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many :todos }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end
end
