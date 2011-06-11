# == Schema Information
# Schema version: 20110611060437
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  first_name         :string(255)
#  last_name          :string(255)
#  location           :string(255)
#  birth_date         :date
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  token              :integer
#  active             :boolean
#

require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :first_name, :last_name, :email, :location, :birth_date, :password, :password_confirmation
  has_many :jobs
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => {:case_sensitive => false}
  validates :first_name, :length   => { :maximum => 50 }
  

  before_save :encrypt_password , :if=>:has_password?
  
  def has_password?a
    !@password.blank?
  end

  private
    def encrypt_password
       self.encrypted_password = encrypt(password)
      true
    end

    def encrypt(string)
      Digest::SHA2.hexdigest(string)
    end
  
    def active?
      active
    end
  
    def activate!
      self.active = true
      save
    end
end
