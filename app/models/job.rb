class Job < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :title, :company
  
  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :company, :presence => true, :length => { :maximum => 50 }  
  # validates :user_id, :presence => true
end
