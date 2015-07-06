class User < ActiveRecord::Base
  has_secure_password
  has_many :taken_surveys
  has_many :surveys

  validates :email, presence: true

  def authenticate(password)
     self.password == password
  end

end
