module Api
  class PaginateSerializer < ActiveModel::Serializer::CollectionSerializer
    def initialize(resources, options = {})
      @collection_root = options.delete(:root)
      super(resources, options)
      @pagination = options[:pagination]
    end

    def serializable_hash(adapter_options, options, adapter_instance)
      hash = { @collection_root => super(adapter_options, options, adapter_instance) }
      if @pagination
        hash[:pagination] = @pagination.slice(:page, :items, :count)
      end
      hash
    end
  end
end
