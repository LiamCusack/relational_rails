class Restaurant < ApplicationRecord
  validates_presence_of :name, :date_opened, :style
end
