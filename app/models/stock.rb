# == Schema Information
#
# Table name: stocks
#
#  id         :integer         not null, primary key
#  ticker     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Stock < ActiveRecord::Base
  
  validates :ticker, presence: true, uniqueness: true
  
end
