class Item < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  enum manufactured_by: { 'Self': 1, 'Outside': 2 }

  has_many :item_charges, dependent: :destroy

  def price_and_casting
    (copper_price + casting_labor).to_f
  end

  def price_burning
    (copper_price * (burning_per / 100)).to_f
  end

  def net_price
    (copper_price - price_burning).to_f
  end

  def waste
    (require_rod - net_weight).to_f
  end

  def require_material
    (require_rod * price_and_casting).to_f
  end

  def total_waste
    (waste * net_price).to_f
  end

  def base_cost
    (require_material - total_waste).to_f
  end

  def total_charges
    item_charges.sum(&:amount).to_f
  end

  def base_cost_before_margin
    (base_cost + total_charges).to_f
  end

  def profit
    (base_cost_before_margin * (profit_margin / 100)).to_f
  end
    
  def final_cost
    (base_cost_before_margin + profit).to_f
  end

end
