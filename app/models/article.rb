class Article < ActiveRecord::Base

	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   #attr_accessor :watermark


   has_many :article_kinds
   has_many :kinds, :through => :article_kinds

   def image_url
   	 return image.url(:medium)
   end

   def link_url

   	 url = "http://loogou.herokuapp.com/articles/"
   	 return "#{url}#{id}"
   end
end
