class WebsitePdf < ActiveRecord::Base
  #attr_accessible :file, :file_name

  validates_presence_of :file, :file_name
  mount_uploader :file, WebsitePdfUploader

  FILENAMES = [
  	'Tricks Newsletter',
  # 	'Tricks Registration Form',
  	'Tricks Release Form',
  	'Tricks Family Rules',
  	'Tricks Class Sessions',
  	'Tricks Instructor Application',
  	'Tricks Office Application',
  # 	'Dance Schedule (GraniteBay)',
  # 	'Dance Schedule (Folsom)',
  # 	'Dance Schedule (Sacramento)',
  ]
  def to_param
    "#{file_name}"
  end
end
