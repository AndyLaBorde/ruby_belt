class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def create
		@user = User.create(user_params)

		if @user.valid?
			session[:user_id] = @user.id
			return redirect_to songs_path
		elsif 
			flash[:errors] = @user.errors.full_messages
			return redirect_to :back		
		end
	end

	def login
		@user = User.find_by(email: params[:email])

		if @user
			if @user.try(:authenticate, params[:password])
				session[:user_id] = @user.id

				return redirect_to songs_path
			end
			flash[:errors] = ['Password is incorrect']
		else 
			flash[:errors] = ['Email is invalid']

		end
		return redirect_to :back
	end

	def show
		@user = User.find(params[:id])
	end


	def destroy
  		reset_session

  		return redirect_to root_path
  	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
