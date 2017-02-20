require 'page-object'
require 'rspec/expectations'

class GoogleHomePage
  include PageObject
  include DataMagic

  page_url "http://www.google.com/ncr"

  text_field :search, :name => "q"

  def search_for term
    self.search = term
    self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
  end

end
