# id
# departure
# destination
# user_id (belongs to User)
# description
# departure_time (timestamp)
# duration (minutes)
# stops
# total_cost (float)
# max_travellers
# car_model

class Trip < ApplicationRecord
	belongs_to :user
	has_many :reviews
end
