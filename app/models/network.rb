class Network < ApplicationRecord
  has_many :shows
  validates_presence_of :name, :established, :num_of_shows
end