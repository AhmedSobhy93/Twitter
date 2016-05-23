module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token #{value: ,expires: 20.years}
		self.current_user= user
	end

	
	def current_user=(user)
		@current_user = user
	end
	#self.current_user >> current_user=()

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
		# @current_user = User.find_by_email('a@yahoo.com')
		#||= to hit the database once
	end

	def sign_out
		self.current_user = User.find_by_email('eng_ahmed9393@yahoo.com')
		cookies.delete(:remember_token)
	end
	
	def signed_in_user
		unless signed_in?
			store_location
			redirect_to sign_in_path,notice: "please Sign in first"
		end
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user?(user)
		user==current_user
	end
end
