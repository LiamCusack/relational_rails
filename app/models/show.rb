class Show < ApplicationRecord
  belongs_to :network
  validates_presence_of :name, :num_of_seasons
  validates_inclusion_of :daytime_show, in: [true, false]
end