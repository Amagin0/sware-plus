module ApplicationHelper

  def page_title
    title = "SwAre+"
    title = @page_title + " | " + title if @page_title
    title
  end

  def resource_name
    :customer
  end

  def resource
    @resource ||= customer.new
  end

  def resource_class
    Customer
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:customer]
  end
end