class User < ApplicationRecord
    has_secure_password

  before_save :downcase_email
  before_create :generate_confirmation_instructions

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :age, presence: true
  validates :password,
            length: { minimum: 3 },
            if: -> { new_record? || !password.nil? }

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end 
  
  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end

  def confirmation_token_valid?
    (self.confirmation_sent_at + 3.days) > Time.now.utc
  end
  
  def mark_as_confirmed!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    self.email_confirmed = true
    save
  end
end
