class Event < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  #validates :location, presence: true
  #validates :price, presence: true
  #validates :capacity, presence: true
  #validates :includes_food, presence: true
  #validates :includes_drink, presence: true
  #validates :starts_at, presence: true
  #validates :ends_at, presence: true
  #validates :active, presence: true

def bargain?
  price < 30
end

def self.order_by_price
    order :price
  end

end
