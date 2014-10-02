class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.fetch_reviews
  end
end
