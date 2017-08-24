class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" },
                              length: { minimum: 6, allow_nil: true }
  before_validation(on: :create) { ensure_session_token }

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if BCrypt::Password.new(user.password_digest).is_password?(password)
      user
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!
  end

  def ensure_session_token
    self.session_token = User.generate_session_token if session_token.nil?
  end

  def password=(pw_input)
    @password = pw_input
    self.password_digest = BCrypt::Password.create(pw_input)
  end

end
