require "lfo_api/version"
require "faraday"

API_URL = "http://not-real.com/customer_scoring"

module LfoApi

  class Customer

    def self.get_score(income, zipcode, age)
      response = Faraday.get("#{API_URL}?income=#{income}&zipcode=#{zipcode}&age=#{age}")
      attributes = JSON.parse(response.body)
    end
  end

end