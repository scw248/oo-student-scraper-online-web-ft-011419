require 'open-uri'
require 'pry'
require "nokogiri"
require "open-uri"

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(index_url)
    student_array = []
    profiles = {}
    
    doc.css("div student-card").each do |profile|
      profiles[:name] = ("h4.student_name").text
      profiles[:location] = ("p.student-location").text
      profiles[:profile_url] = ("div student-card a href")
      student_array << profiles
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    
  end

end
