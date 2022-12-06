# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associaitons' do
    it {
      should belong_to(:creator).class_name('User').with_foreign_key('creator_id')
    }
    it { should have_and_belong_to_many(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
