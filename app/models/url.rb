class Url < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url,
  with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2-4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_short_url

  def generate_short_url
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map{|range| range.to_a}.flatten

    self.short_url = 6.times.map{chars.sample}.join
    self.short_url = 6.times.map{chars.sample}.join until Url.find_by_short_url(self.short_url).nil?
  end

  def find_duplicate
    Url.find_by_sanitized_url(self.santized_url)
  end

  def new_url?
    find_duplicate.nil?
  end

  def sanitize
    self.original_url.strip!
    self.sanitized_url = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    self.sanitized_url.slice!(-1) if self.sanitized_url[-1] == " /"
    self.santizied_url = "http://#{self}.santizied_url"
  end
end
