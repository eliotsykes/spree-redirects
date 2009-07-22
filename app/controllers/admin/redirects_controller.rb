class Admin::RedirectsController < Admin::BaseController
  resource_controller
  
  private
  #Thanks to Admin::UsersController in spree-core for initial code
  def collection   
    @search = Redirect.new_search(params[:search])
    #set order by to default or form result
    @search.order_by ||= :from
    @search.order_as ||= "ASC"
    #set results per page to default or form result
    @search.per_page ||= Spree::Config[:admin_products_per_page]
    @collection, @collection_count = @search.all, @search.count
  end
end
