module User::WithAuthentication
  extend ActiveSupport::Concern

  included do
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    enum role: { visitor: 0, admin: 10 }

    has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :destroy

    has_many :access_tokens,
            class_name: 'Doorkeeper::AccessToken',
            foreign_key: :resource_owner_id,
            dependent: :destroy
  end
end