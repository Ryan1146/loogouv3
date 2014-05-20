class ArticleKind < ActiveRecord::Base
		belongs_to :article
		belongs_to :kind
end
