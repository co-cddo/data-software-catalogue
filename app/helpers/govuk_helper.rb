module GovukHelper
  def govuk_browser_title
    return controller_name.titleize if action_name == 'index'
    return "#{controller_name.singularize} #{params[:id]}".titleize if action_name == 'show'

    "#{action_name} #{controller_name.singularize} #{params[:id]}".titleize
  end

  def govuk_link_to(name = nil, options = nil, html_options = {}, &block)
    html_options[:class] = [html_options[:class], 'govuk-link'].flatten.compact
    link_to(name, options, html_options, &block)
  end
end
