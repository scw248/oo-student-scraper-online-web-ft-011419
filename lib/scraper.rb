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
      profiles[:name] = 
      profiles[:location] =
      profiles[:profile_url] =
      student_array << profiles
    end
    student_array
    #name: ("h4.student_name").text
    #location: ("p.student-location")
    #profile_url: 
  end

  def self.scrape_profile_page(profile_url)
    
  end

end
