module DashboardHelper
  
  def get_sidebar_current_class(key)

    path = "#{params[:controller]}_#{params[:action]}"
    if key == path
      return "current"
    end
  end

end
