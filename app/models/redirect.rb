class Redirect < ActiveRecord::Base
  
  composed_of :status, :mapping => %w(status code), :converter => Proc.new { |status| Status.new(status) }
  belongs_to :target
  # Validate that from is a path begining with a slash.
  validates_format_of :from, :with => /^\/.*$/
  validates_associated :target
  validates_presence_of :target
  
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
