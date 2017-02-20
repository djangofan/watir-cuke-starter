require 'page-object'
require 'rspec/expectations'

class GooglePage
  include PageObject
  include DataMagic

  param_example = "id=<%=params[:id]%>"

  page_url "http://www.google.com/ncr"
  div :results, :id => "resultStats"
  text_field :search, :name => "q"
  button(:go, name: 'btnG')

  def click_search
    self.go
  end

  def on_page?
    self.button_link.exists?
  end

  def search_for(term)
    self.search = term
  end

  def number_search_results
    result = /[\s\D]*([\d,]+) results \(\d+\.\d+ seconds\)/.match(results)
    raise "Could not determine number of search results from: '#{results}'" if not result
    result.captures[0].gsub(",","").to_i
  end

end
