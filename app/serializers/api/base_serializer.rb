module Api
  class BaseSerializer < ActiveModel::Serializer
    def initialize(object, options = {})
      super(object, options)
    end

    def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
      hash = super(adapter_options, options, adapter_instance)
      @root ? { @root => hash } : hash
    end
  end
end
