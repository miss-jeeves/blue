# == Schema Information
# Schema version: 20110228181210
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  island     :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :island
   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, :presence => true, :format   => { :with => email_regex }, :uniqueness => { :case_sensitive => false})
  validates(:name,  :presence => true, :length   => { :maximum => 24 })
end
