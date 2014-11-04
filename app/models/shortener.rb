class Shortener < ActiveRecord::Base
  attr_accessible :orig_url, :shortened_url
  UNIQUE_PATH_LENGTH = 5
  HOST_NAME = 'http:localhost:3002'#'http://dry-cliffs-6195.herokuapp.com'
  def self.generate orig_url
    shortener = find_by_orig_url orig_url
    return shortener if shortener

    begin
      unique_path = generate_random_string UNIQUE_PATH_LENGTH
    end while find_by_shortened_url unique_path
    shortener = create orig_url: orig_url, shortened_url: shortened_url(unique_path)
    shortener
  end

  def self.generate_random_string length=5
    char_set= ('a'..'z').to_a + (0..9).to_a
    (0..length).map { char_set[rand(char_set.size)]}.join
  end

  def self.shortened_url unique_path
    "#{HOST_NAME}/s/#{unique_path}"
  end
end
