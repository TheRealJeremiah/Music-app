# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string           not null
#  lyrics     :text
#  bonus      :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :album_id, :name, presence: true
  belongs_to :album
end
