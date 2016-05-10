require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages/home" do
    it "should have the content'Welcome'" do
      visit 'static_pages/home'
      page.should have_content("Welcome")
    end
  end
end
