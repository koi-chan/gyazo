class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :digest, presence: true, uniqueness: true
  before_validation :update_data_attributes

  private

  def update_data_attributes
    if image.present? && changed?
      self.digest = image.digest
    end
  end
end
