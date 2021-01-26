class Tweet < ApplicationRecord
  validates :text, presence: true
   # imageも空で投稿できないように追記
  validates :text, :image, presence: true
  belongs_to :user
  has_many :comments

  

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
    
  end
end