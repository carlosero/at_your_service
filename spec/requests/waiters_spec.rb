require 'rails_helper'

RSpec.describe "Waiters", type: :request do
  describe "GET /waiters" do
    it "works! (now write some real specs)" do
      get waiters_path
      expect(response).to have_http_status(200)
    end
  end
end
