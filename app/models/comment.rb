class Comment < ApplicationRecord

  belongs_to :article  # articlesテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

end
