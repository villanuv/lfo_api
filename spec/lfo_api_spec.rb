require 'spec_helper'

describe LfoApi do
  it 'has a version number' do
    expect(LfoApi =>:VERSION).not_to be nil
  end
end

describe LfoApi::Customer do
  # let(:customer) { LfoApi::Customer.new(50000, 60201, 35) }

  # describe "#initialize" do
  #   it "assigns @income" do
  #     expect(customer.income).to eq 50000
  #   end

  #   it "assigns @zipcode" do
  #     expect(customer.zipcode).to eq 60201
  #   end

  #   it "assigns @age" do
  #     expect(customer.age).to eq 35
  #   end
  # end

  describe "#get_score" do
    let(:score) { LfoApi::Customer.get_score(50000, 60201, 35) }

    it 'makes call to fake website, uses static json file' do
      expect(score.keys).to contain_exactly('propensity', 'ranking')
    end

    it "returns score data" do
      expect(score["propensity"]).to eq 0.26532
      expect(score["ranking"]).to eq "C"
    end
  end
end
