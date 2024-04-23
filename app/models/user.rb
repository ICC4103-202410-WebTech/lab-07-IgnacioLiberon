class User < ApplicationRecord
    has_many :posts, class_name: 'Post'

    before_save :downcase_email

    validates :name, presence: {message: 'El nombre debe ser especificado'}
    validates :email, presence: {message: 'Debe ingresar un correo electronico'}, uniqueness: {message: 'El correo ingresado ya está registrado.'},
    format: {with: URI::MailTo::EMAIL_REGEXP, message: "Asegurese de ingresar un correo electronico valido. (usuario@example.com)" }
    validates :password, length: {minimum: 6, message: "La contraseña ingresada es muy corta"}

    private
    def downcase_email
        self.email = email.downcase
    end
end
