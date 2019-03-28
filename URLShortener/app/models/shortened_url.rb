class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true
    validates :short_url, presence: true, uniqueness: true
    validates :user_id, presence: true, uniqueness: true

    def self.random_code
        randurl = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(randurl)
            randurl = SecureRandom.urlsafe_base64
        end
        randurl
    end

    def self.make_url(user, longurl)
        ShortenedUrl.create!(long_url: longurl, short_url: ShortenedUrl.random_code, user_id: user.id)
    end

    belongs_to :submitter, 
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User'

    has_many :visits,
        primary_key: :id,
        foreign_key: :shorturl_id,
        class_name: 'Visit'

    has_many :visitors,
        through: :visits,
        source: :visitor
end