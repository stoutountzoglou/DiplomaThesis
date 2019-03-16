class ReviewsController < ApplicationController
	def create
		review = Review.new
		review.review_text = params['review_text'] if params['review_text']
		review.rating = params['rating'] if params['rating']
		review.reviewer_id = params['reviewer_id'] if params['reviewer_id']
		review.user_id = params['user_id'] if params['user_id']
		review.trip_id = params['trip_id'] if params['trip_id']
		review.save
	end

	# 10 minutes since creation
	def update
		review = Review.find(params['id'].to_i) if params['id']
		review.review_text = params['review_text'] if params['review_text']
		review.rating = params['rating'] if params['rating']
		review.reviewer_id = params['reviewer_id'] if params['reviewer_id']
		review.user_id = params['user_id'].to_i if params['user_id']
		review.trip_id = params['trip_id'].to_i if params['trip_id']
		review.save
	end

	# 10 minutes since creation
	def destroy

	end
end
