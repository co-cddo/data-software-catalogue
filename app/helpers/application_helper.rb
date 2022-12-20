module ApplicationHelper
  def page_title(prefix)
    return prefix if current_page?(root_url)

    [prefix, page_title_suffix].flatten.map(&:titleize).join(' - ')
  end

  def page_title_suffix
    return "Organisation #{params[:organisation_id]} Software" if controller_name == 'software_instances' && action_name == 'index'
    return controller_name if action_name == 'index'
    return [controller_name, action_name] if params[:id].blank?

    [controller_name, "#{action_name} #{params[:id]}"]
  end
end
