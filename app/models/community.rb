class Community < ApplicationRecord
  enum category: {music:1, movie:2, entertainment:3, game:4, book:5, art:6, sport:7, moter:8, trip:9, diy:10, animal:11, pc:12, fashion:13, cook:14, fortune:15, hobby:16, marry:17, spiritual:18, life:19, health:20, housekeep:21, social:22, school:23, organization:24, occupation:25, qualification:26, business:27}

  validates :community_name, presence: true, length: { maximum: 20}
  mount_uploader :image, ImageUploader
end
