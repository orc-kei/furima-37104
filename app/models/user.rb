class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,         presence: true
         validates :family_name,
         format: { with: /\A[ぁ-んァ-ン一-龥]/}, presence: true

         validates :first_name,       
         format: { with: /\A[ぁ-んァ-ン一-龥]/},presence: true

         validates :family_name_kana, 
         format: { with: /\A[ぁ-んァ-ン一-龥]/},presence: true

         validates :first_name_kana,  
         format: { with: /\A[ぁ-んァ-ン一-龥]/},presence: true
         validates :birthday,         presence: true

         validates :password,
         format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}

         has_many :items
         has_many :buys

         end
