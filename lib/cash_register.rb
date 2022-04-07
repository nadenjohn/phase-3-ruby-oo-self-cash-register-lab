require 'pry' 

class CashRegister
    attr_accessor :discount, :total, :items, :last_item

    def initialize(discount = 0, total = 0, items=[])
        @discount = discount
        @total = total
        @items = items
       
    end
    def add_item(title, price, quantity = 1)
        cost = (price * quantity)
        self.total += cost  
        total_items = "#{title} " * quantity
        mult_total = total_items.split
        self.items = self.items +  mult_total
        self.last_item = price * quantity
    end

   def apply_discount
        if discount > 0
            self.total -= (total * (discount.to_f/100))
            "After the discount, the total comes to $#{(self.total).to_i}."
        else
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
       self.total = self.total - self.last_item
    end
end
