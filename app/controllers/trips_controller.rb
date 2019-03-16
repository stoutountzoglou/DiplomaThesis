class TripsController < ApplicationController

	def create
		trip = Trip.new
		trip.departure = params['departure'] if params['departure']
		trip.destination = params['destination'] if params['destination']
		trip.user_id = params['user_id'] if params['user_id']
		trip.description = params['description'] if params['description']
		trip.departure_time = params['departure_time'] if params['departure_time']
		trip.duration = params['duration'] if params['duration']
		trip.stops = params['stops'] if params['stops']
		trip.total_cost = params['total_cost'] if params['total_cost']
		trip.max_travellers = params['max_travellers'] if params['max_travellers']
		trip.car_model = params['car_model'] if params['car_model']
		trip.save
	end

	# (αν είναι δικό μου το session): για να έχει την επιλογή να βάλει φωτογραφία αργότερα
	def update
		trip = Trip.find(params['id'].to_i) if params['id']
		trip.departure = params['departure'] if params['departure']
		trip.destination = params['destination'] if params['destination']
		trip.user_id = params['user_id'] if params['user_id']
		trip.description = params['description'] if params['description']
		trip.departure_time = params['departure_time'] if params['departure_time']
		trip.duration = params['duration'] if params['duration']
		trip.stops = params['stops'] if params['stops']
		trip.total_cost = params['total_cost'] if params['total_cost']
		trip.max_travellers = params['max_travellers'] if params['max_travellers']
		trip.car_model = params['car_model'] if params['car_model']
		trip.save
	end

	def destroy
		# if session is mine
	end

	# αν δεν είναι logged in, μη στέλνεις email, name, surname
	def trip_search
		res = []
		trips = Trip.where(departure: params['departure'], destination: params['destination'])
					.pluck(:user_id, :description, :departure_time, :duration, :stops, :total_cost, :max_travellers, :car_model)
		trips.each do |t|
			user = User.find(t[0])
			res << { user_id: t[0],
					 email: user.email || nil, 
					 name: user.name || nil,
					 surname: user.surname,
					 description: t[1],
					 departure_time: t[2],
					 duration: t[3],
					 stops: t[4],
					 total_cost: t[5],
					 max_travellers: t[6],
					 car_model: t[7] }
		end
		render json: res
	end
end
