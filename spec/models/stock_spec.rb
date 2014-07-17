# == Schema Information
#
# Table name: stocks
#
#  id         :integer         not null, primary key
#  ticker     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Stock do
  before { @stock = Stock.new(ticker: "AAPL") }
  
  subject { @stock }
  
  tables = [:options]
  tables.each do |table|
    describe "#{table} associations" do |table|
      it { should have_many table }
    end
  end
  
  fields = [:ticker]
  fields.each do |field|
     it { should respond_to(field) }
     it { should validate_presence_of(field) }
     it { should validate_uniqueness_of(field) }
  end
  
  it { should be_valid }
end
