class Review < ActiveRecord::Base
  include HTTParty
  base_uri 'http://api.nytimes.com/svc/movies/v2/reviews/search.json?api-key=247b93157509e7e302709ee77c987b3d:17:69904243'

  def self.fetch_reviews
    HTTParty.get(base_uri)
  end
end
