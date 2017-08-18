class EmploymentApplication < ActiveRecord::Base
    has_one :address, :as => :addressable
    accepts_nested_attributes_for :address
    
    has_many :employment_histories, :as => :history
    accepts_nested_attributes_for :employment_histories
    
	mount_uploader :image, ApplicantImageUploader
end
