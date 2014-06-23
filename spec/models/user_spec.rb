# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  username               :string(255)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
  before { @user = User.new(username: "Login_name",
                            email: "tuser@example.com",
                            password: "foobar21",
                            password_confirmation: "foobar21",
                            reset_password_token: nil,
                            reset_password_sent_at: nil,
                            remember_created_at: nil,
                            sign_in_count: 0,
                            current_sign_in_at: nil,
                            last_sign_in_at: nil,
                            current_sign_in_ip: nil,
                            last_sign_in_ip: nil,
                            confirmation_token: nil,
                            confirmed_at: nil,
                            confirmation_sent_at: nil,
                            unconfirmed_email: nil,
                            created_at: nil,
                            updated_at: nil) }

  subject { @user }
  
  fields = [:username]
  fields.each do |field|
    it { should respond_to(field) }
    it { should validate_presence_of(field) }
  end
  
  it { should be_valid }
end
