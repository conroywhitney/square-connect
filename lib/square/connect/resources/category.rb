module Square
  module Connect
    module Resource
      class Category
        # https://docs.connect.squareup.com/api/connect/v1/#datatype-category

        attr_reader :id, :name

        def initialize(category)
          raise ArgumentError, 'Error parsing Category from nil' unless category

          @id = category['id']
          @name = category['name']
        end
      end
    end
  end
end
