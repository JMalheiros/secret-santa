# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :users

  validates :name, presence: true
end
