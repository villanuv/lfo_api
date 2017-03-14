require 'spec_helper'

describe LfoApi do
  it 'has a version number' do
    expect(LfoApi =>:VERSION).not_to be nil
  end
end

describe LfoApi::Customer do

  before do
    @customer = LfoApi::Customer.new
    @good_url = 'http://not-real.com/customer_scoring?income=35000&zipcode=60601&age=40'
    @scoring_advice = @customer.get_scoring_advice(@good_url)
  end

  describe "#valid_url?" do
    it "returns true only if income, zipcode and age parameters are included" do
      expect(@customer.valid_url?(@good_url)).to eq true
    end

    it "returns false if income parameter is missing" do
      bad_url = 'http://not-real.com/customer_scoring?zipcode=60601&age=40'
      expect(@customer.valid_url?(bad_url)).to eq false
    end

    it "returns false if zipcode parameter is missing" do
      bad_url = 'http://not-real.com/customer_scoring?income=35000&age=40'
      expect(@customer.valid_url?(bad_url)).to eq false
    end

    it "returns false if age parameter is missing" do
      bad_url = 'http://not-real.com/customer_scoring?income=35000&zipcode=60601'
      expect(@customer.valid_url?(bad_url)).to eq false
    end
  end

  describe "#get_scoring_advice" do
    context "Passing a Valid URL" do
      it "calls fake website" do
        expect(@scoring_advice.keys).to contain_exactly('propensity', 'ranking')
      end

      it "returns a hash" do
        expect(@scoring_advice).to be_a_kind_of(Hash)
      end

      it "returns scoring advice, uses static json file" do
        expect(@scoring_advice["propensity"]).to eq 0.26532
        expect(@scoring_advice["ranking"]).to eq "C"
      end
    end

    context "Passing an Invalid URL" do
      it "returns nil" do
        invalid_request = @customer.get_scoring_advice('http://not-real.com/customer_scoring?income=35000&zipcode=60601')
        expect(invalid_request).to be_nil
      end
    end
  end

  describe "#propensity" do
    it "returns propensity value, uses static json file" do
      expect(@customer.propensity).to eq 0.26532
    end
  end

  describe "#ranking" do
    it "returns ranking value, uses static json file" do
      expect(@customer.ranking).to eq "C"
    end
  end

end
