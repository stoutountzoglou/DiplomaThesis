# id
# email
# name
# surname
# town
# about_me
# gender
# profile_picture_url
# password_digest

class User < ApplicationRecord
	has_many :reviews
	has_many :trips
end
