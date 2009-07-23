class Status
  
  attr_accessor :code
  
  def initialize(code)
    self.code = code.to_i
    @errors = ActiveRecord::Errors.new self
  end

  def valid?
    return code == 301 || code == 302
  end
  
  VALUES = [Status.new(301), Status.new(302)]
  
  def summary
    I18n.translate "status_#{code}"
  end
  
  def ==(obj)
    return obj.kind_of?(Status) && obj.code == self.code
  end
  
end
