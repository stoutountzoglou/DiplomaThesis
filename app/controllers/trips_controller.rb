class TripsController < ApplicationController
	def dashboard
	end

	def index
		@trips = Trip.all
	end
	
	def new
		@trip = Trip.new
	end

	def create
		@trip = Trip.new(trip_params)
		@trip.user_id = 1
		if @trip.save
			flash[:notice] = 'Το ταξίδι καταχωρήθηκε επιτυχώς!'
			redirect_to trip_path(@trip)
		else
			render 'new'
		end
	end

	def show
		@trip = Trip.find(params[:id])
	end

	# (αν είναι δικό μου το session): για να έχει την επιλογή να βάλει φωτογραφία αργότερα
	def edit
		@trip = Trip.find(params[:id])
	end

	def update
		@trip = Trip.find(params[:id])
		if @trip.update(trip_params)
			flash[:notice] = 'Το ταξίδι ανανεώθηκε επιτυχώς!'
			redirect_to trip_path(@trip)
		else
			render 'edit'
		end
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

	private

	def trip_params
		params.require(:trip).permit(:departure, :destination, :description)	
	end
end
