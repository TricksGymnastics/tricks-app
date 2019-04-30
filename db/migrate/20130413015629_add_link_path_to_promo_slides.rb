class AddLinkPathToPromoSlides < ActiveRecord::Migration
  def change
    add_column :promo_slides, :link_path, :string
  end
end
