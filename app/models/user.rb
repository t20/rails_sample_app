# == Schema Information
# Schema version: 20110611013828
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  location   :string(255)
#  birth_date :date
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :jobs
end
