class Review < ActiveRecord::Base
  include HTTParty

  def self.populate_records(offset)
    begin
      base_uri = "#{Figaro.env.nytimes_base_uri}offset=#{offset}&api-key=#{Figaro.env.nytimes_review_key}"

      api_data = HTTParty.get(base_uri)

      # Here the HASH is being manipulated which was in response to the API call.
      # The data is being stored inside the database if not already created.
      
      if api_data['results'].present?
        api_data['results'].each do |data|
          url =  data['multimedia'].nil? ? '/assets/avatar.jpg' : data['multimedia']['resource']['src']
          opening_date = data['opening_date'].present? ? data['opening_date'].to_datetime : nil

          self.find_or_create_by( display_title: data['display_title'],
                                  headline: data['headline'],
                                  summary_short: data['summary_short'],
                                  suggested_link_text: data['link']['suggested_link_text'],
                                  suggested_link_text_url: data['link']['url'],
                                  image_url: url,
                                  opening_date: opening_date )
        end
      end
    rescue => exception
      logger.info('Something went wrong with the API.')
    end
  end

end
