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
  # presenceがlaravelでいう requiredに該当
  validates :name, presence: true, length: {minimum:1, maximum:10}
  validates :title, presence: true, length: {minimum:1, maximum:30}
  validates :body, presence: true, length: {minimum:1, maximum:1000}
end
