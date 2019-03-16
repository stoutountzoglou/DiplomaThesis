# id
# reviewer_id
# user_id (reviewee) (belongs to User)
# trip_id (belongs to Trip)
# rating
# text
class Review < ApplicationRecord
	belongs_to :trip
	belongs_to :user

	validates :reviewer_id, :user_id, :trip_id, :rating, :text, presence: true
end
