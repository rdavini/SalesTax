class Item < ApplicationRecord
    after_validation :calculateTax
    before_validation :sanitize_content, :on => :create

    validates :desc, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
    validates :price, presence: true, numericality: true
    validates :qty, presence: true, numericality: { only_integer: true }

    def calculateTax
        return unless (self.desc.present? and self.price.present? and self.qty.present?)
        self.total_price = (self.qty * self.price + ItemHelper.round_to(self.qty * basic_tax + self.qty * imported_tax)).round(2)
    end

    def imported_tax
        is_imported ? price*5/100 : 0
    end

    def is_imported
        self.desc.include? "imported"
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

    private
    def sanitize_content
        ActionController::Base.helpers.sanitize(self.desc)
    end
end
