class Network < ApplicationRecord
  has_many :shows, dependent: :destroy
  validates_presence_of :name, :established

  def shows_count
    shows.count
  end
end