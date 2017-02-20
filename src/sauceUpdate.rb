#example proving this works
require 'httparty'

sauce_user = 'erewrr'
sauce_key = '34343243234324343'
auth = {:username => sauce_user, :password => sauce_key}

job_id = '334324324750b44cffaba48f8bd85849d3'

put_body = '{
    "passed": "true",
    "tags": ["testing-rest-api"],
    "name": "REST API Test 3",
    "custom-data": {"source": "Testing REST API"}
}'

response = HTTParty.put("https://saucelabs.com/rest/v1/#{sauce_user}/jobs/#{job_id}", :body => put_body, :basic_auth => auth,
                        :headers => {"Content-Type" => 'application/json'}, :verify => false, :debug_output => $stdout)

puts response.body




