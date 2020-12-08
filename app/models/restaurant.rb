class Restaurant < ApplicationRecord
  validates_presence_of :name, :date_opened, :style
  has_many :dishes, dependent: :destroy

  def dish_count
    dishes.count
  end
end
