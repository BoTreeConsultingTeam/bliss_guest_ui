module Utilities
  module HttpUtilities
    def send_http_request(url_link, method, parameters, as_query_string = true )
      uri = URI.parse("http://localhost:5000/#{url_link}")
      uri.query = URI.encode_www_form(parameters) if as_query_string
      begin
        http = Net::HTTP.new(uri.host, uri.port)
        http.read_timeout = 150
        request =  method == 'post' ? Net::HTTP::Post.new(uri.request_uri) : Net::HTTP::Get.new(uri.request_uri)
        request.set_form_data(parameters) unless as_query_string
        request.basic_auth("superuser", "superuser")
        http.request(request)
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => ex
        puts ex.message
        puts ex.backtrace.join("\n")
      end
    end
  end
end