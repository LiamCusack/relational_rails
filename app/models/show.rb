class Show < ApplicationRecord
  belongs_to :network
  validates_presence_of :name, :daytime_show
end