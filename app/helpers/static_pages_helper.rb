module StaticPagesHelper

  def resource
    User.new
  end

  def resource_name
    "user"
  end
  
end
