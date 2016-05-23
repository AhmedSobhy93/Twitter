require 'rails_helper'

RSpec.describe "AuthenticationPages", type: :request do

	subject {page}
  describe "signin page" do
  	before { visit signin_path }

    it {should have_selector("h1",text: 'Sign In')}
      
  end
end
