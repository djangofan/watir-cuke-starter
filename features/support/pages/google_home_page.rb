require 'page-object'
require 'rspec/expectations'

class GoogleHomePage
  include PageObject
  include DataMagic

  page_url "http://www.google.com/ncr"

  text_field :search, :name => "q"
  button(:go, name: 'btnK')
  button(:lucky, name: 'btnI')

  def click_search
    #self.go_button.click
  end

  def on_page?
    self.submit_element.exists?
  end

  def search_for term
    self.search = term
    self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
  end

end
