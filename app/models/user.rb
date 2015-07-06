class User < ActiveRecord::Base
  has_secure_password
  has_many :taken_surveys
  has_many :surveys
end
