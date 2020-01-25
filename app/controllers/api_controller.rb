class ApiController < ActionController::API
  def response_bad_request(message)
    render status: 400, json: {message: message}
  end
end
