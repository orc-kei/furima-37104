class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  with_options presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } do
  validates :family_name
  validates :first_name
  end

  validates :family_name_kana,format: { with: /\A[ァ-ヶー－]+\z/  }, presence: true

  validates :first_name_kana,format: { with: /\A[ァ-ヶー－]+\z/  }, presence: true
  
  validates :birthday, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i }

  has_many :items
  has_many :buys
end
