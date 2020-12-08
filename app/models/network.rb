class Network < ApplicationRecord
  has_many :shows, dependent: :destroy
  validates_presence_of :name, :established

  def self.most_recent
    order(established: :desc)
  end
end