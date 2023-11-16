class Comment < ApplicationRecord
    belongs_to :article
    validates :commentor, :body, presence:true
end