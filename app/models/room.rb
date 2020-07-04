class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates_presence_of :home_type, :room_type, :accommodate, :bed_room, :bath_room

  validate :publish_params

  def can_publish?(skip_active=false)
    (skip_active || !self.active) && self.price.present? && self.listing_name.present? && self.photos.any? && self.summary.present? && self.address.present?
  end

  def publish_params
    if self.active_was
      self.errors.add(:base, I18n.t(:error_room_cant_be_publish_if_public))
    end
    if self.active_changed? && self.active && !self.active_was && !self.can_publish?(!self.active_was)
      self.errors.add(:base, I18n.t(:error_room_cant_be_publish))
    end
  end
end
