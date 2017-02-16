class Show < ActiveRecord::Base
	def self.highest_rating
		highest_rated = self.all.order(rating: :desc).first
		highest_rated[:rating]
	end

	def self.most_popular_show
		self.all.order(rating: :desc).first		
	end

	def self.lowest_rating
		lowest_rated = self.all.order(rating: :asc).first
		lowest_rated[:rating]
	end

	def self.least_popular_show
		self.all.order(rating: :asc).first		
	end

	def self.ratings_sum
		count = 0
		self.all.each do |show|
			count += show[:rating]
		end
		count
	end

	def self.popular_shows
		self.where("rating > 5")
	end

	def self.shows_by_alphabetical_order
		self.order(name: :asc)
	end

end