module Square
  module Connect
    module Resource
      class Category
        attr_reader :id, :name

        def initialize(category)
          @id = category['id']
          @name = category['name']
        end
      end
    end
  end
end
