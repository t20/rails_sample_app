# == Schema Information
# Schema version: 20110611013828
#
# Table name: jobs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  company    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Job < ActiveRecord::Base
  belongs_to :user
end
