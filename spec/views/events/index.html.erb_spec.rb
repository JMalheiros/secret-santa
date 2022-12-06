# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  let(:user) { create(:user) }
  let(:event) { create(:event, creator: user) }
  let(:event2) { create(:event, creator: user) }

  before(:each) do
    sign_in user
    assign(:events, [event, event2])
  end

  it 'renders a list of events' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
