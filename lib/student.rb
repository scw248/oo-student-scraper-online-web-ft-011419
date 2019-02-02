class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @twitter = student_hash[:twitter]
    @linkedin = student_hash[:linkedin]
    @github = student_hash[:github]
    @blog = student_hash[:blog]
    @profile_quote = student_hash[:profile_quote]
    @bio = student_hash[:bio]
    @profile_url = student_hash[:profile_url]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      self.new(student)
    end
  end

  def add_student_attributes(attributes_hash)
    self.bio = "I was in southern California for college (sun and In-n-Out!), rural Oregon for high school (lived in a town with 1500 people and 3000+ cows), and Tokyo for elementary/middle school."
    self.blog = "someone@blog.com"
    self.linkedin = "someone@linkedin.com"
    self.profile_quote = "\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi"
    self.twitter = "someone@twitter.com"
  end

  def self.all
    @@all
  end
end

