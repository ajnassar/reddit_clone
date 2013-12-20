class LinkSub < ActiveRecord::Base
  attr_accessible :link_id, :sub_id
  validates :link_id, :sub_id, presence: true
  validates :link_id, :uniqueness => {:scope => :sub_id }
  belongs_to :link
  belongs_to :sub

end
