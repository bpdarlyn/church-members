class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  belongs_to :person

  def is?(role)
    role == self.person.rolable.class.name.downcase.to_sym
  end
end
