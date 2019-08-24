module ApplicationHelper
  def selected_option(collection, model)
    collection.include?(model)
  end
end
