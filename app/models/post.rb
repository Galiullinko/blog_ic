class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :text, :title, presence: true

  scope :by_user, -> (user) { where(user: user) }
end
