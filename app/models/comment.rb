class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :parent_comment_id, :user_id

  belongs_to :link
  belongs_to :user
  belongs_to :parent_comment
  has_many(
    :child_comments,
    :foreign_key => :parent_comment_id,
    :class_name => "Comment"
  )

end
