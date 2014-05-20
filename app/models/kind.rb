class Kind < ActiveRecord::Base

	
    has_many :article_kinds
    has_many :articles , :through => :article_kinds
end
