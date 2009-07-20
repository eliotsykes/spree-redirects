class TaxonTarget < Target
  belongs_to :taxon
  
  def location
    seo_url taxon
  end
end
