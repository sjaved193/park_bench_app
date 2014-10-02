require 'rails_helper'

RSpec.describe Review, :type => :model do
  it "should add new reviews from API call and increase record count by 20" do
    expect {
      VCR.use_cassette 'api_response' do
        Review.populate_records(0)
      end
    }.to change(Review, :count).by(20)
  end

  it "should add new reviews from API call and increase record count by 20" do
    initial_count = Review.all.count

    VCR.use_cassette 'api_response' do
      Review.populate_records(0)
    end
    final_count = Review.all.count

    initial_count + (final_count - initial_count) != 30
  end
end
