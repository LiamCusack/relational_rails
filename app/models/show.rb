class Show < ApplicationRecord
  belongs_to :network
  validates_presence_of :name, :num_of_seasons
  validates_inclusion_of :daytime_show, in: [true, false]

  def self.shows_count
    count
  end

  def self.true_before_false
    order(daytime_show: :desc)
  end
end