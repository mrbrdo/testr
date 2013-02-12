module ApplicationHelper
  def api_host
    "http://#{request.host_with_port}/api/v1"
  end
end
