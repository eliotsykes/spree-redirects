class Admin::RedirectsController < Admin::BaseController
  resource_controller
  
  create.before do
    populate_redirect_with_target
  end
  
  create.failure.after do
    populate_form_models
  end
  
  create.wants.html { redirect_to collection_url }
  
  edit.before do
    populate_form_models
  end
  
  update.before do
    populate_redirect_with_target
  end
  
  update.failure.after do
    populate_form_models
  end
  
  update.wants.html { redirect_to collection_url }
  
  private
  def populate_redirect_with_target
    @redirect.target = Target.find_or_initialize params
  end
  
  def populate_form_models
    @target = @redirect.target
    @product = @target.product if @target.kind_of? ProductTarget
    @taxon = @target.taxon if @target.kind_of? TaxonTarget    
  end
  
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
