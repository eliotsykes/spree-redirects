class Redirect < ActiveRecord::Base
  belongs_to :target
  
  def target_location
    target.location
  end
  
  def target_type_humanized
    target.type_humanized
  end
end
