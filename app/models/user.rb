class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\..+\z/ }

  before_save { self.email = email.try(:downcase) }

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  def self.get_token(email, password)
    user = User.where(email: email).first
    if user.try(:authenticate, password)
      user.get_token
    end
  end

  def get_token
    app = Doorkeeper::Application.where(name: "App").first
    if app.present?
      Doorkeeper::AccessToken.create(application_id: app.id, resource_owner_id: self.id).token
    end
  end

  before_create { generate_token(:auth_token) }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def to_s
    email
  end
end
