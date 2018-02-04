module ApplicationHelper
  def picture_classes_for_form(project)
    project.picture_classes.order('picture_classes.id asc').collect.with_index do |picture_class, index|
      ["#{index + 1}. #{picture_class.name}", picture_class.id]
    end
  end
end
