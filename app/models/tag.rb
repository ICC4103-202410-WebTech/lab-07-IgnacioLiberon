class Tag < ApplicationRecord
  has_many :post_tags, class_name: 'PostTag'
  has_many :posts, through: :post_tags, class_name: 'Post'

  validates :name, presence: {message: 'Debe ingresar un nombre'}, uniqueness: {message: 'El nombre ya está registrado'}

end
