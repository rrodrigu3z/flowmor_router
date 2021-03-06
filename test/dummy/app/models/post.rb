class Post < RoutableRecord
  belongs_to :category, class_name: "PostCategory", counter_cache: true

  set_controller_action "blog#show"

  # Appending category name to the route name prefix
  def route_name_prefix
    super + "_#{category_name}"
  end
  
  def category_name
    category.try(:name) || 'general'
  end
  
  def route
    "/#{category_name}/#{name}"
  end
end
