module Response
  def json_response(object, status = :ok, serializer = nil, options = {})
    response_obj = { json: object, status: status }
    response_obj.merge({ serializer: serializer, options: options }) if serializer
    render response_obj
  end
end
