class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.string :name, null: false

      t.timestamps
    end

 # 都道府県データを追加
 Prefecture.create(name: '北海道')
 Prefecture.create(name: '青森県')
 Prefecture.create(name: '岩手県')
 Prefecture.create(name: '宮城県')
 Prefecture.create(name: '秋田県')
 Prefecture.create(name: '山形県')
 Prefecture.create(name: '福島県')
 Prefecture.create(name: '茨城県')
 Prefecture.create(name: '栃木県')
 Prefecture.create(name: '群馬県')
 Prefecture.create(name: '埼玉県')
 Prefecture.create(name: '千葉県')
 Prefecture.create(name: '東京都')
 Prefecture.create(name: '神奈川県')
 Prefecture.create(name: '新潟県')
 Prefecture.create(name: '富山県')
 Prefecture.create(name: '石川県')
 Prefecture.create(name: '福井県')
 Prefecture.create(name: '山梨県')
 Prefecture.create(name: '長野県')
 Prefecture.create(name: '岐阜県')
 Prefecture.create(name: '静岡県')
 Prefecture.create(name: '愛知県')
 Prefecture.create(name: '三重県')
 Prefecture.create(name: '滋賀県')
 Prefecture.create(name: '京都府')
 Prefecture.create(name: '大阪府')
 Prefecture.create(name: '兵庫県')
 Prefecture.create(name: '奈良県')
 Prefecture.create(name: '和歌山県')
 Prefecture.create(name: '鳥取県')
 Prefecture.create(name: '島根県')
 Prefecture.create(name: '岡山県')
 Prefecture.create(name: '広島県')
 Prefecture.create(name: '山口県')
 Prefecture.create(name: '徳島県')
 Prefecture.create(name: '香川県')
 Prefecture.create(name: '愛媛県')
 Prefecture.create(name: '高知県')
 Prefecture.create(name: '福岡県')
 Prefecture.create(name: '佐賀県')
 Prefecture.create(name: '長崎県')
 Prefecture.create(name: '熊本県')
 Prefecture.create(name: '大分県')
 Prefecture.create(name: '宮崎県')
 Prefecture.create(name: '鹿児島県')
 Prefecture.create(name: '沖縄県')
end
end
