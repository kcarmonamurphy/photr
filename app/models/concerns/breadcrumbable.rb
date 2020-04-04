module Breadcrumbable
  extend ActiveSupport::Concern

  def breadcrumbs
    url_parts.map.with_index do |_, index|
      a = url_parts[0..index].inject({url: [], name: nil}) do |memo, value|
        memo[:url] << value
        memo[:name] = value
        memo
      end
      a[:url] = a[:url].join('/')
      a
    end
  end
end