module GovukHelper
  def govuk_link_to(name = nil, options = nil, html_options = {}, &block)
    html_options[:class] = [html_options[:class], 'govuk-link'].flatten.compact
    link_to(name, options, html_options, &block)
  end
end
