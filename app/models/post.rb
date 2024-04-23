class Post < ApplicationRecord
    belongs_to :user, class_name: 'User'

    has_many :post_tags, class_name: 'PostTag'
    has_many :tags, through: :post_tags, class_name: 'Tag'
    has_many :posts, class_name: "Post", foreign_key: 'post_id'
    belongs_to :post, class_name: 'Post', optional: true

    before_validation :set_default_published_at

    validates :title, :content, :user_id, presence: {message: 'Debe ser entregado por el usuario'}
    validates :answers_count, :likes_count, numericality: {greater_than_or_equal_to: 0 , message: "La cantidad de respuestas o likes no es valida."}

    private
    def set_default_published_at
        self.published_at ||=Time.zone.now
    end
end
