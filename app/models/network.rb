class Network < ApplicationRecord
  has_many :shows, dependent: :destroy
  validates_presence_of :name, :established, :num_of_employees

  def shows_count
    shows.count
  end
end