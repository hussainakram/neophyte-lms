class Resource < ApplicationRecord
	belongs_to :challenge
	has_many :images , dependent: :destroy
	has_many :documents , dependent: :destroy
	has_many :links , dependent: :destroy

	accepts_nested_attributes_for :images, allow_destroy: true
                                
    accepts_nested_attributes_for :documents, allow_destroy: true
                                  
    accepts_nested_attributes_for :links, allow_destroy: true

	

	

	#YT_LINK_FORMAT = /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/

  	# validates :link  # , format: YT_LINK_FORMAT

  	# validates_format_of :link, :with => URI::regexp(%w(http https youtube))
  


end
