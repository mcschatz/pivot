class AboutContent
  def initialize
  end
  def generate
    {:about_us => about_us}
  end

  def about_us
    Content.find_by(name: "about-us").payload
  end
end