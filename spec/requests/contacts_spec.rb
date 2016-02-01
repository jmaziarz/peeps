require 'rails_helper'

RSpec.describe "Contacts API", type: :request do
  describe 'GET /contacts/:id', type: :request do
    it 'sends an individual user' do
      contact = FactoryGirl.create(:contact)

      get "/contacts/#{contact.id}", nil, { 'Accept' => 'application/vnd.api+json' }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /contacts/:id', type: :request do
    it 'updates a contact' do
      contact = FactoryGirl.create(:contact)

      # Quoting is not right
      new_attributes = { 'data': { 'type': 'contacts', 'id': "#{contact.id}", 'attributes': { 'name_first': Faker::Name.first_name, 'name_last': Faker::Name.last_name, 'email': Faker::Internet.email } } }.to_json

      put "/contacts/#{contact.id}", new_attributes, { 'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/vnd.api+json' }

      # If HTTP 400, try be_success
      #expect(response).to have_http_status(:success)
      expect(response).to be_success
    end
  end
end
