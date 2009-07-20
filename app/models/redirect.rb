class Redirect < ActiveRecord::Base
  belongs_to :target
  
  def target_location
    target.location
  end
end
