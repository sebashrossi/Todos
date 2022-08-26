require 'rails_helper'

RSpec.describe Todo, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :status }
  end
end
