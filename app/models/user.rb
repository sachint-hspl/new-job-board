class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :job_postings
  has_many :job_applications

  attr_accessor :name

  def has_role?(name)
    roles.exists?(name: name.to_s.upcase)
  end

  def add_role(name)
    role = Role.find_by(name: name.to_s.upcase)
    # roles << role if role && !has_role?(role.name)
    user_roles.find_or_create_by(role:)
  end
end
