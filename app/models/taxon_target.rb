class TaxonTarget < Target
  include ProductsHelper
  
  belongs_to :taxon
  
  def location
    seo_url taxon
  end
end
