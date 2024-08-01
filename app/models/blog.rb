class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  before_create :set_published_at
  private

  def set_published_at
    self.published_at ||= Time.current
  end
  # validates :image, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes }
end
