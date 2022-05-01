class Article < ApplicationRecord
  resourcify
  has_rich_text :content
  belongs_to :user

end
