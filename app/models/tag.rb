# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  # N対N , throughtで中間テーブルの経由先を定義つけることができる
  # hasMany では複数形で書く
  has_many :board_tag_relations
  has_many :boards, through: :board_tag_relations
end
