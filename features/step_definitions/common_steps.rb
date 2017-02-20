Given 'I am on the Guinea Pig homepage' do
  @page = visit GuineaPigPage, using_params: {foo: :bar}
end

Given 'I am on the Google homepage' do
  @page = visit GoogleHomePage, using_params: {foo: :bar}
end
