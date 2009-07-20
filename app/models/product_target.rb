class ProductTarget < Target
  belongs_to :product
  
  def location
    product
  end
end

