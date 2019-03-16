class UsersController < ApplicationController
	def show
		render json: { name: User.find(params['id']).name}
	end
	# sign up
	def create
		user = User.new
		user.email = params['email'] if params['email']
		user.name = params['name'] if params['name']
		user.surname = params['surname'] if params['surname']
		user.town = params['town'] if params['town']
		user.about_me = params['about_me'] if params['about_me']
		user.gender = params['gender'] if params['gender']
		user.save
	end

	# (αν είναι δικό μου το session): για να έχει την επιλογή να βάλει φωτογραφία αργότερα
	def update
		user = User.find(params['id'].to_i) if params['id']
		user.email = params['email'] if params['email']
		user.name = params['name'] if params['name']
		user.surname = params['surname'] if params['surname']
		user.town = params['town'] if params['town']
		user.about_me = params['about_me'] if params['about_me']
		user.gender = params['gender'] if params['gender']
		user.save
	end

	def destroy
		# later on
	end

	def user_search
		render json: { name: User.where(town: params['town']).pluck(:name)}
	end
end
