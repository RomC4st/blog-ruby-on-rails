class Article < ApplicationRecord
  resourcify
  has_rich_text :content
end
