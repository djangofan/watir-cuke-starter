require 'page-object'
require 'rspec/expectations'

class TheInternetPage
  include PageObject
  include DataMagic

  param_example = "id=<%=params[:id]%>"

  page_url "http://the-internet.herokuapp.com/"

  h1 :heading, :class => 'heading'

  def on_page?
    self.heading_element.exists?
  end

  def get_parameter
    return param_example
  end

  def get_heading_text
    @browser.h1(:class => 'heading').text
  end

  def get_nav_elements
    @browser.elements(:xpath => ".//li/a")
  end

end
