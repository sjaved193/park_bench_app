class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    page_no = params[:page].present? ? params[:page].to_i : 1
    Review.populate_records((page_no-1) * 20) if page_no == 1 || page_no % 2 == 0
    @reviews = Review.all.paginate(:page => page_no, :per_page => 10)
  end
end
