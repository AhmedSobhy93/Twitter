require 'spec_helper'
	
	describe User do
	before do
		@user = User.new(fullName: "Example User",email: "eng_ahmed@yahoo.com",
			phoneNumber: "01143439044",password: "123123",password_confirmation: "123123")
	end

	subject { @user }

	it { should respond_to(:fullName) }
	it { should respond_to(:email) }
	it { should respond_to(:phoneNumber) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it {should be_valid}


	describe "when fullName is too long" do
		before { @user.fullName = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save

		end

	it {should_not be_valid}
	end

end