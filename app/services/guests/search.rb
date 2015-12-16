class Guests::Search
  include Utilities::HttpUtilities

  def initialize(parameters)
    @parameters = parameters
  end

  def call
    response = send_http_request('/entity/search_guest_entity.json', 'post', @parameters )
    JSON.parse(response.body)
  end
end