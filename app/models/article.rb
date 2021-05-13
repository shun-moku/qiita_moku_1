class Article < ApplicationRecord

  validates :text, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション

  def self.search(search)
     if search != "" #"検索欄ではない場合に実行"
      Article.where('text LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end

end
