class Restaurant < ApplicationRecord
  validates_presence_of :name, :date_opened, :style
  has_many :dishes, dependent: :destroy

  def dish_count
    dishes.count
  end

  def self.sort_by_date_desc
    order(date_opened: :desc)
  end
end
