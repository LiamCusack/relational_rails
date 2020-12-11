class Network < ApplicationRecord
  validates_presence_of :name, :established
  has_many :shows, dependent: :destroy

  def self.most_recent
    order(established: :desc)
  end

  def self.order_by_shows
    select('networks.*, COUNT(*) AS count').joins(:shows).group(:id).order(count: :asc)
  end
end