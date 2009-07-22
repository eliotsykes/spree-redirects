# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class RedirectsExtension < Spree::Extension
  version "1.0"
  description "Redirects extension manages moved pages for Spree"
  url "http://github.com/eliotsykes/spree-redirects"

  def activate

    Admin::BaseController.class_eval do
      before_filter :add_redirects_tab
      
      def add_redirects_tab
        @extension_tabs << [ :redirects ]
      end
    end

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
        redirect_to redirect.target_location, :status => redirect.status.code
      end
    end
    
  end
end
