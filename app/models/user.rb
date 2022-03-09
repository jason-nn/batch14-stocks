class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :transactions, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :welcome_email
  after_update :approved_email

  private

  def welcome_email
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def approved_email
    if self.approved_previously_was == false && self.approved == true
      UserMailer.with(user: self).approved_email.deliver_later
    end
  end
end
