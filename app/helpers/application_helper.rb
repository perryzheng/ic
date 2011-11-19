module ApplicationHelper
  def logo
    image_tag("ic.jpg", :alt=>"Sample App", :class=>"round")
  end

  #Return a title on a per-page basis
  def title
    base_title = "International Community"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_remove_bullet_point_content(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_bullet_point_content(this)")
  end
  
  def link_to_add_fields(name, f, association, jsMethodName)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, jsMethodName + "(this, '#{association}', '#{escape_javascript(fields)}')")
  end
end
