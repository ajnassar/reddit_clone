class User < ActiveRecord::Base
  attr_accessible :password, :username
  attr_reader :password
  before_validation :reset_session_token
  validates :username, :session_token, :password_digest, presence: true
  validates :password, presence: true, on: :create

  has_many :links
  has_many :comments
  has_many(
    :moderated_subs,
    :primary_key => :id,
    :foreign_key => :moderator_id,
    :class_name => "Sub"
  )

  def self.find_by_credentials(username, pass)
    user = User.find_by_username(username)
    if user
      return user if user.is_password?(pass)
    else
      nil
    end
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
    @password = pass
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.reset_session_token
    self.save!
  end
end
