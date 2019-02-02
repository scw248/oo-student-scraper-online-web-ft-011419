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
      #binding.pry
      student[:name] = profile.css(".student-card a div h4.student-name").text
      student[:location] = profile.css(".student-card a div p.student-location").text
      student[:profile_url] = profile.css("div.student-card a").attribute("href").value
      student_array << student
    end
    binding.pry
    student_array
    
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    attributes = {}
    
    doc.css("html").each do |attribute|
      attributes[:twitter] = attribute.css("div.social-icon-container a").attribute("href").value unless !attribute.css("div.social-icon-container a").attribute("href").value
      attributes[:linkedin] = attribute.css("div.social-icon-container a").attribute("href").value unless !attribute.css("div.social-icon-container a").attribute("href").value
      attributes[:github] = attribute.css("div.social-icon-container a").attribute("href").value unless !attribute.css("div.social-icon-container a").attribute("href").value
      attributes[:blog] = attribute.css("div.social-icon-container a").attribute("href").value unless !attribute.css("div.social-icon-container a").attribute("href").value
      attributes[:profile_quote] = attribute.css("div.profile-quote").text
      attributes[:bio] = attribute.css("div.description-holder p").text
    end
    #binding.pry
    attributes
  end


end