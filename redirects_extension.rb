# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class RedirectsExtension < Spree::Extension
  version "1.0"
  description "Redirects extension manages redirect rules for Spree"
  url "http://github.com/eliotsykes/spree-redirects"

  def activate

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes

    #Admin::BaseController.class_eval do
    #  before_filter :add_yourextension_tab
    #
    #  def add_yourextension_tab
    #    # add_extension_admin_tab takes an array containing the same arguments expected
    #    # by the tab helper method:
    #    #   [ :extension_name, { :label => "Your Extension", :route => "/some/non/standard/route" } ]
    #    add_extension_admin_tab [ :yourextension ]
    #  end
    #end

    Spree::BaseController.class_eval do
      prepend_before_filter :redirect_filter
      
      private
      def redirect_filter
        from_path = request.path
        logger.debug "RedirectsExtension: from_path = '#{from_path}'"
        redirect = Redirect.find_by_from(from_path)
        if (redirect.nil?)
          logger.debug "RedirectsExtension: no redirect found"
          return
        end
        logger.debug "RedirectsExtension: redirecting to '#{redirect}'"
        redirect_to redirect.target_location, :status => redirect.status
      end
    end
    
  end
end
