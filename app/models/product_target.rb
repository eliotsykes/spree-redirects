class ProductTarget < Target
  
  belongs_to :product
  validates_associated :product
  validates_presence_of :product
  
  def location
    product
  end
  
end

