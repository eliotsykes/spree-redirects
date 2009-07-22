class Admin::RedirectsController < Admin::BaseController
  resource_controller
  
  new_action.after do
    @target = UrlTarget.new
    #@product_target = ProductTarget.new
    #@taxon_target = TaxonTarget.new
  end

  create.before do
    @target = UrlTarget.new params[:target]
    #@product_target = ProductTarget.new(params[:product_target])
    #@taxon_target = TaxonTarget.new(params[:taxon_target])
    @redirect.target = @target
  end
  create.wants.html do 
    redirect_to collection_url
  end
  
  edit.before do
    @target = @redirect.target
  end
  
  update.before do
    @redirect.target.update_attributes params[:target]
  end
  update.wants.html { redirect_to collection_url }
  
  private
  #Thanks to Admin::UsersController in spree-core for initial code
  def collection   
    @search = Redirect.new_search(params[:search])
    #set order by to default or form result
    @search.order_by ||= :updated_at
    @search.order_as ||= "DESC"
    #set results per page to default or form result
    @search.per_page ||= Spree::Config[:admin_products_per_page]
    @collection, @collection_count = @search.all, @search.count
  end
end
