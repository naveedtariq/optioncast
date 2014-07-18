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

class Option < ActiveRecord::Base
  
  belongs_to :stock
  
end
