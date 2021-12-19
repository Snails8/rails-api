# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  body       :text
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  # boardから複数のcommentオブジェクトを取得できる
  # dependentでboardが削除されたときにcommentも削除する
  has_many :comments, dependent: :delete_all

  # tagとのリレーション(NN)
  has_many :board_tag_relations
  has_many :tags, through: :board_tag_relations

  # presenceがlaravelでいう requiredに該当
  validates :name, presence: true, length: { maximum:10}
  validates :title, presence: true, length: { maximum:30}
  validates :body, presence: true, length: { maximum:1000}
end
