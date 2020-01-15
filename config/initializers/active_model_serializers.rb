require 'active_model_serializers'
require "#{Rails.root}/app/serializers/api/pagination_serializer"
ActiveModelSerializers.config.collection_serializer = Api::PaginateSerializer
