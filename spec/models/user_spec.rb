# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it {
      should have_many(:created_events).class_name('Event').with_foreign_key('creator_id')
    }
    it { should have_and_belong_to_many(:events) }
  end
end
