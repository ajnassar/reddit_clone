class Sub < ActiveRecord::Base
  attr_accessible :moderator_id, :name

  validates :moderator_id, :name, :presence => true

  belongs_to :moderator, :class_name => "User"
  has_many :links


end
