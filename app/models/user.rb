class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { visitor: 0, admin: 10 }

  def to_s
    full_name.blank? ? email : full_name
  end

  def full_name
    @full_name ||= "#{first_name} #{last_name}".strip
  end
end
