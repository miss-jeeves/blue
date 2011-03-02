class Nanopost < ActiveRecord::Base
attr_accessible :content, :site
belongs_to :user

validates :content, :presence => true, :length => { :maximum => 500 }
validates :user_id, :presence => true

default_scope :order => 'nanoposts.created_at DESC'

end
