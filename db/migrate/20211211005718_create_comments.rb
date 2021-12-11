class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      # 外部キー制約で存在しないidを防ぐ
      t.references :board, null: false, foreign_key: true
      # notnull成約で必須項目に
      t.string :name, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
