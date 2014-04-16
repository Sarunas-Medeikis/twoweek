class User < ActiveRecord::Base
	has_many :articles

	validates :name, :password, :presence => true
end
