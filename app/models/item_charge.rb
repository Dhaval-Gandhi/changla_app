class ItemCharge < ApplicationRecord
  belongs_to :item

  CHARGE_OPTIONS = ['Labour', 'Checking', 'Color']

end
