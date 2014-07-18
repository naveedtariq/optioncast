# == Schema Information
#
# Table name: options
#
#  id                 :integer         not null, primary key
#  stock_id           :integer
#  price              :decimal(6, 2)
#  volume             :integer
#  expiry             :date
#  option_type        :string(255)
#  strike             :decimal(7, 2)
#  last               :decimal(7, 2)
#  bid                :decimal(7, 2)
#  ask                :decimal(7, 2)
#  open_interest      :integer
#  delta              :decimal(7, 4)
#  gamma              :decimal(7, 4)
#  theta              :decimal(7, 4)
#  vega               :decimal(7, 4)
#  implied_volatility :decimal(5, 4)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Option do
  let!(:stock) { FactoryGirl.create(:stock) }
  
  before { @option = Option.new(stock_id: stock.id,
                                price: 540.67,
                                volume: 0,
                                expiry: Date.new(2014,1,24),
                                option_type: "P",
                                strike: 390,
                                last: 0.01,
                                bid: 0,
                                ask: 0.02,
                                open_interest: 17,
                                delta: -0.0006,
                                gamma: 0.0041,
                                theta: -1.5798,
                                vega: 0.1282,
                                implied_volatility: 0.9861)}
                                
  subject { @option }
  
  tables = [:stock]
  tables.each do |table|
    it { should belong_to table }    
  end
  
  fields = [:stock_id, :price, :volume, :expiry, :option_type, :strike, :last, :bid, :ask, :open_interest, :delta, :gamma, :theta, :vega, :implied_volatility]
  fields.each do |field|
    it { should respond_to(field) }
  end
  
  it { should be_valid }
end
