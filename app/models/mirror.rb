require 'open-uri'

class Mirror < ApplicationRecord
  validates :format,
      :inclusion  => { :in => [ 'JSON', 'XML' ],
      :message    => "%{value} is not a valid format. Currently, only JSON and XML are supported." }
  before_save :update_timestamp, :create_filename, :create_mirrored_url
  #after_save :refresh
  
  def refresh
    @mirror = Mirror.find(:params[:id])
    uri = URI(@mirror.source)
    open('test.json', 'wb') do |file|
      file << open(uri).read
    end
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
