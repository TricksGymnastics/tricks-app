class EmploymentApplication < ActiveRecord::Base
    has_one :address, :as => :addressable
    accepts_nested_attributes_for :address
    
    has_many :employment_histories, :as => :history
    accepts_nested_attributes_for :employment_histories
    attr_accessible :image, :resume
	mount_uploader :image, ApplicantImageUploader
	mount_uploader :resume, ApplicantResumeUploader
end
