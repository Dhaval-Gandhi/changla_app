class Item < ApplicationRecord
  validates :code, uniqueness: true

  enum manufactured_by: { 'self': 1, 'outside': 2 }
end
