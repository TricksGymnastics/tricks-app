class AddLinkPathToPromoSlides < ActiveRecord::Migration[4.2]
  def change
    add_column :promo_slides, :link_path, :string
  end
end
