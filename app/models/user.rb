class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, format: { with: /\A.+@.+\..+\z/ }

  before_save { self.email = email.try(:downcase) }

  def get_token
    app = Doorkeeper::Application.where(name: "WebApp").first
    if app.present?
      Doorkeeper::AccessToken.create(application_id: app.id, resource_owner_id: self.id).token
    end
  end

  def to_s
    email
  end
end
