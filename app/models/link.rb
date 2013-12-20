class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :user_id, :sub_ids
  validates :title, :url, :user_id, presence: true

  belongs_to :user
  has_many :comments
  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub


end
