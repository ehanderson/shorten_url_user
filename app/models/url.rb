class Url < ActiveRecord::Base
  belongs_to :user
  
  validates :original_url, format: { with: /https*\:\/\/\w+\.\w+\.\w{2,5}/ }
  validates :shortened_url, uniqueness: true

  def self.shorten
    possible_characters = []
    possible_characters << ('a'..'z').to_a
    possible_characters << ('A'..'Z').to_a
    possible_characters << ('0'..'9').to_a
    possible_characters.flatten!
    short_url = []
    7.times do    
     short_url << possible_characters[rand(61)]
    end
   short_url.join
end

end
