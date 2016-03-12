module Square
  module Connect
    module Resource
      class Item
        attr_reader :id, :fees, :variations, :available_for_pickup, :available_online, :visibility,
                     :description, :name, :category_id, :category, :type

        def initialize(item)
          @id = item['id']
          @fees = item['fees']
          @variations = item['variations']
          @available_for_pickup = item['available_for_pickup']
          @available_online = item['available_online']
          @visibility = item['visibility']
          @description = item['description']
          @name = item['name']
          @category = item['category']
          @category_id = item['category_id']
          @type = item['type']
        end
      end
    end
  end
end
