class Post < ApplicationRecord
belongs_to :user
has_many :postcomment

end
