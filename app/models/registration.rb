class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    self.price = event.price
    total_days = guests_count.to_i
    self.total = price * guests_count
  end
end
