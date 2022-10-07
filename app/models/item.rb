class Item < ApplicationRecord
    attribute :total_price, :float, default: 0.0
    after_initialize :calculateTax

    def calculateTax
        self.total_price = self.qty * self.price + self.qty * basic_tax + self.qty * required_tax
    end

    def required_tax
        price*5/100
    end

    def basic_tax
        is_free_basic_tax ? 0 : price/10
    end

    def is_free_basic_tax
        item_type_free_tax = ItemTypeFreeTax.all

        item_type_free_tax.each do |it|
            return true if self.desc.include? it.name
        end
        return false
    end

    def as_json(options = nil)
        {
          qty: qty,
          desc: desc,
          price: total_price
        }
      end
end
