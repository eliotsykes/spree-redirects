class Redirect < ActiveRecord::Base
  
  composed_of :status, :mapping => %w(status code), :converter => Proc.new { |status| Status.new(status) }
  belongs_to :target
  
  def target_location
    target.location
  end
  
  def target_type_humanized
    target.type_humanized
  end
  
  def status_summary
    status.summary
  end
end
