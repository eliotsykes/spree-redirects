class Status
  
  attr_accessor :code
  
  def initialize(code)
    self.code = code
  end
  
  VALUES = [Status.new(301), Status.new(302)]
  
  def summary
    I18n.translate "status_#{code}"
  end
  
end
