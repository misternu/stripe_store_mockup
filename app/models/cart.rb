class Cart < ApplicationRecord
  has_many :items

  def count
    items.map(&:quantity).reduce(&:+) || 0
  end
end
