class UrlTarget < Target
  
  # Validate that the url is a full URL or a path begining with a slash.
  validates_format_of :url, :with => /^(\/|http[s]?[:]\/\/).*$/
  
  def location
    url
  end
  
  def type_humanized
    'URL'
  end
  
end
