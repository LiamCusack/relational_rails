class Show < ApplicationRecord
  validates_presence_of :name, :daytime_show
end