class User < ActiveRecord::Base
  has_many :urls
  def self.authenticate(email, password)

    user = User.find_by_email(email)
    if user == nil
    else user if user.password == password
    end 
  end
end

