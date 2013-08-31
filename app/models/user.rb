class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :password, :username, :password_confirmation
end
