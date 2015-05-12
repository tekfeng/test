module Admin::BaseHelper
  def link_to_remove_fields(name, f)
    content_tag(:div, f.hidden_field(:_destroy) + link_to(name, '#', onclick: "remove_fields(this); return false;", class: 'btn btn-danger pull-right'), class: "clearfix")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :builder => builder)
    end
    
    content_tag(:div, link_to(name, '#', onclick: "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\"); return false;", class: "btn btn-info pull-right"), class: "clearfix")    
  end
  
  def static_page_code_to_name(code)
    return "Privacy Policy" if code == 'privacy_policy'
    return "Terms of Use" if code == 'terms_of_use'
  end
end