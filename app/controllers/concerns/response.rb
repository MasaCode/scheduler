module Response
  def json_response(object, status = :ok, serializer = nil, options = {})
    response_obj = { json: object, status: status, root: "data" }.merge(options)
    response_obj.merge({ serializer: serializer }) if serializer
    render response_obj
  end
end
