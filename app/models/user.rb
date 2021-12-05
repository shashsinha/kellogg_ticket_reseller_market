class User < ApplicationRecord
  # Direct associations

  has_many   :bought_tickets,
             :foreign_key => "bought_by_id",
             :dependent => :destroy

  has_many   :events,
             :foreign_key => "created_by_id",
             :dependent => :destroy

  has_many   :tickets,
             :foreign_key => "sold_by_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
