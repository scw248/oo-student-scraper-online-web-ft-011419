require 'open-uri'
require 'pry'
require "nokogiri"
require "open-uri"

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_array = []
    
    doc.css(".roster-cards-container").each do |profile|
      student = {}
      binding.pry
      student[:name] = profile.css(".student-card a div h4.student-name").text
      student[:location] = profile.css(".student-card a div p.student-location").text
      student[:profile_url] = profile.css("div.student-card a href")
      student_array << student
    end
    student_array
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end
