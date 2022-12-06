# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  let(:user) { create(:user) }
  let(:event) { create(:event, creator: user) }

  before(:each) do
    sign_in user
    assign(:event, event)
  end

  it 'renders attributes in <p>' do
    render
  end
end
