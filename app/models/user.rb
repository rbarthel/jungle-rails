class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    corrected_email = email.downcase.delete(' ')
    user = User.find_by_email(corrected_email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
