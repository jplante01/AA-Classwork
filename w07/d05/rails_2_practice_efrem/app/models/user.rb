class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true} 

  has_many :goals
  #ASPIRE
  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return nil if user.nil?
    
    if user.is_valid_password?(password)
      return user
    else
      nil
    end

  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_valid_password?(password)
    p = BCrypt::Password.new(self.password_digest)
    p.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::base64
  end

end
