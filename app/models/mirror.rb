require 'open-uri'
require 'net/http'

class Mirror < ApplicationRecord
  validates :format,
      :inclusion  => { :in => [ 'JSON', 'XML' ],
      :message    => "%{value} is not a valid format. Currently, only JSON and XML are supported." }
  before_save :create_filename, :create_mirrored_url, :check_mirror_health
  after_save :refresh, :update_timestamp
  
  def refresh
    if self.health?
      uri = URI(self.source)
      open(self.filename, 'wb') do |file|
        file << open(uri).read
      end
    end
  end
  
  def check_mirror_health
    uri = URI(self.source)
    res = Net::HTTP.get_response(uri)
    self.health = res.is_a?(Net::HTTPSuccess)
  end
  
  protected
  def update_timestamp
    self.last_updated = DateTime.now
  end
  def create_filename
    shortname = self.name.downcase.tr(' ', '_')
    self.filename = shortname + "." + self.format.downcase
  end
  def create_mirrored_url
    self.mirrored_url = "https://www.washingtonpost.com/mir/"+self.filename
  end
  
end
