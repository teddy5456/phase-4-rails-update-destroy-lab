class Plant < ApplicationRecord
    validates :name, :image, :price, :is_in_stock, presence: true

    def last_name
        name.split.last
      end
    
end
