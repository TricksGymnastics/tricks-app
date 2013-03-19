class RecitalAdType < ActiveRecord::Base
  attr_accessible :name, :fields_attributes
  has_many :fields, class_name: "RecitalAdField"
  accepts_nested_attributes_for :fields, allow_destroy: true
end
