# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/events', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    let!(:event) { create(:event, creator: user) }

    it 'renders a successful response' do
      get events_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:event) { create(:event, creator: user) }

    it 'renders a successful response' do
      get event_url(event)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_event_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:event) { create(:event, creator: user) }

    it 'renders a successful response' do
      get edit_event_url(event)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        attributes_for(:event)
      end

      it 'creates a new Event' do
        expect do
          post events_url, params: { event: valid_attributes }
        end.to change(Event, :count).by(1)
      end

      it 'redirects to the created event' do
        post events_url, params: { event: valid_attributes }
        expect(response).to redirect_to(event_url(Event.last))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        { description: '' }
      end

      it 'does not create a new Event' do
        expect do
          post events_url, params: { event: invalid_attributes }
        end.to change(Event, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post events_url, params: { event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let!(:event) { create(:event, creator: user) }
    let(:user2) { create(:user, email: 'test2@example.com') }

    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'another event', user_ids: [user2.id] }
      end

      it 'updates the requested event' do
        patch event_url(event), params: { event: new_attributes }
        event.reload
        expect(event.name).to eq('another event')
      end

      it 'redirects to the event' do
        patch event_url(event), params: { event: new_attributes }
        event.reload
        expect(response).to redirect_to(event_url(event))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch event_url(event), params: { event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:event) { create(:event, creator: user) }

    it 'destroys the requested event' do
      expect do
        delete event_url(event)
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      delete event_url(event)
      expect(response).to redirect_to(events_url)
    end
  end
end
