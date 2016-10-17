class UsersController < ApplicationController
	def create
		if @user = User.create(user_params)
			redirect_to root_path ,notice: 'Usuario Cadastrado'	
		end
	end


	def user_params
		params.require(:user).permit!
	end
end