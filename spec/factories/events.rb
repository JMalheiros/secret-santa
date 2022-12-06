# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'an event' }
    description { 'some description' }
  end
end
