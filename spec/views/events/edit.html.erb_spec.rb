# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  let(:user) { create(:user) }
  let(:event) { create(:event, creator: user) }

  before(:each) do
    sign_in user
    assign(:event, event)
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(event), 'post' do
    end
  end
end
