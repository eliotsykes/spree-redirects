class TaxonTarget < Target
  include ProductsHelper
  
  belongs_to :taxon
  validates_associated :taxon
  validates_presence_of :taxon
  
  def location
    seo_url taxon
  end
  
end
