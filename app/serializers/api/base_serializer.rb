module Api
  class BaseSerializer < ActiveModel::Serializer
    def initialize(object, options = {})
      options[:root] ||= "data"
      super(object, options)
    end

    def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
      { @root => super(adapter_options, options, adapter_instance) }
    end
  end
end
