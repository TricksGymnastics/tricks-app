class RemoveOrderfromPromoSlidesAndAddSortOrderToPromoSlides < ActiveRecord::Migration[4.2]
  def up
    remove_column :promo_slides, :order
    add_column :promo_slides, :sort_order, :integer
  end

  def down
    remove_column :promo_slides, :sort_order
    add_column :promo_slides, :order, :integer
  end
end
