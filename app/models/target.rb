class Target < ActiveRecord::Base
  has_many :redirects
  
  def self.find_or_initialize(attributes)
    type = attributes[:target][:type]
    return if (type.blank?)
    type = type.constantize
    if ProductTarget == type
      return type.find_or_initialize_by_product_id attributes[:product][:id]
    elsif TaxonTarget == type
      return type.find_or_initialize_by_taxon_id attributes[:taxon][:id]
    elsif UrlTarget == type
      return type.find_or_initialize_by_url attributes[:target][:url]
    end
    raise "Unable to handle target type '#{type}'"
  end
  
  def type_humanized
    type.to_s.sub(/Target$/, '')
  end
  
end
