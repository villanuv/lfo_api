require "lfo_api/version"
require "faraday"


module LfoApi

  class Customer
    attr_accessor :propensity, :ranking

    def valid_url?(url)
      data_hash = CGI.parse(URI.parse(url).query)
      if data_hash.keys.sort == ["age", "income", "zipcode"]
        true
      else
        false
      end      
    end

    def get_scoring_advice(url)
      if valid_url?(url)
        response = Faraday.get(url)
        response_hash = JSON.parse(response.body)
        @propensity = response_hash["propensity"]
        @ranking = response_hash["ranking"]
        return response_hash
      end
    end
  end

end