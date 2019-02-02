require 'open-uri'
require 'pry'
require "nokogiri"
require "open-uri"

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_index_array = []
    
    doc.css(".roster-cards-container").each do |profile|
      profile.css(".student-card a").each do |student_card|
        student = {}
        student[:name] = student_card.css(".student-name").text
        student[:location] = student_card.css(".student-location").text
        student[:profile_url] = student_card.attribute("href").value
        student_index_array << student
      end
      
    end
    #binding.pry
    student_index_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    attributes = {}
    
    doc.css("html").each do |attribute|
      link_array = []
      attribute.css("div.social-icon-container").children.css("a").each do |link|
        
        link_array << link.attribute("href").value
        #binding.pry
      end
      
      link_array.each do |link|
        if link.include?("twitter")
          attributes[:twitter] = link
        elsif link.include?("linkedin")
          attributes[:linkedin] = link
        elsif link.include?("github")
          attributes[:github] = link
        elsif link.include?("blog")
          attributes[:blog] = link
        end
      end
      
      attribute.css("div.description-holder p").text.each do |bio|
        attributes[:bio] = bio
      end
      
      attributes
      
    end
          
          link_array
      
    #   attributes[:twitter] = attribute.css("div.social-icon-container a").attribute("href").value 
    #   attributes[:linkedin] = attribute.css("div.social-icon-container a").attribute("href").value 
    #   attributes[:github] = attribute.css("div.social-icon-container a").attribute("href").value 
    #   attributes[:blog] = attribute.css("div.social-icon-container a").attribute("href").value 
    #   attributes[:bio] = attribute.css("div.description-holder p").text
    # end
    #binding.pry
    attributes
  end

end