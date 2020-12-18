require 'rails_helper'

RSpec.describe "Admin::Messages", type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      ip_address: Faker::Internet.ip_v4_address,
    entry: Faker::Lorem.paragraph
    }
  end

  describe "GET /admin/index" do
    it "renders a successful response" do
      Message.create! valid_attributes
      get admin_messages_url
      expect(response).to be_successful
    end
  end
end
