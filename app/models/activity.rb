class Activity < ActiveRecord::Base
	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   #attr_accessor :watermark


   has_many :activity_categories
   has_many :categories, :through => :activity_categories

   def image_url
   	 return image.url(:medium)
   end

   def link_url

   	 url = "http://loogou.herokuapp.com/activities/"
   	 return "#{url}#{id}"
   end
end
