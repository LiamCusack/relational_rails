class Network < ApplicationRecord
  validates_presence_of :name, :established, :num_of_shows
end