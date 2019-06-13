# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  include Discard::Model

  enum role: %i[user admin]

  after_initialize do
    self.role ||= :user if new_record?
  end

  def active_for_authentication?
    super && !discarded?
  end
end
