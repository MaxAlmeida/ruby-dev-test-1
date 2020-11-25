require 'rails_helper'

RSpec.describe Directory, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:directory).optional }
    it { is_expected.to have_many(:directories) }
  end
end
