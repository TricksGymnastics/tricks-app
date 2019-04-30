class WebsitePdf < ActiveRecord::Base
  #attr_accessible :file, :file_name

  validates_presence_of :file, :file_name
  mount_uploader :file, WebsitePdfUploader

  FILENAMES = [
  	'Tricks Newsletter',
  # 	'Tricks Registration Form',
  	'Tricks Release Form',
  	'Tricks Family Rules',
  	'Tricks Billing Cycle',
  	#'Tricks Instructor Application',
  	#'Tricks Office Application',
  	'Tricks Dance Dress Code',
  	'Tricks Recital Packet',
  	'-------------',
  	'Tumblebunnies Schedule (Granite Bay)',
  	'Tumblebunnies Schedule (Folsom)',
  	'Tumblebunnies Schedule (Sacramento)',
  	'School Age Gymnastics Schedule (Granite Bay)',
  	'School Age Gymnastics Schedule (Folsom)',
  	'School Age Gymnastics Schedule (Sacramento)',
  	'Dance Schedule (Granite Bay)',
  	'Dance Schedule (Folsom)',
  	'Dance Schedule (Sacramento)',
  	'TAG Schedule (Granite Bay)',
  	'TAG Schedule (Folsom)',
  	'TAG Schedule (Sacramento)',
  	'Swim Schedule (Folsom)',
  ]
  def to_param
    "#{file_name}"
  end
end
