class Target < ActiveRecord::Base
  has_many :redirects
  
  def type_humanized
    type.to_s.sub(/Target$/, '')
  end
end
