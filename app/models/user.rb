class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minute
  PASSWORD_RESET_TOKEN_EXPIRATION = 10.minutes
  MAILER_FROM_EMAIL = "no-reply@example.com"

  # Include block
  rolify
  has_secure_password

  # Virtus
  # include Virtus.model

  attribute :email, :string
  attribute :password_digest, :string
  attribute :first_name, :string
  attribute :second_name, :string

  before_save :downcase_email
  before_destroy :remove_all_relations
  after_create :assign_default_role

  # Validate block
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email"}
  validates :password, presence: true, length: {minimum: 8, maximum: 128}, on: :create

  has_many :articles, primary_key: "id", foreign_key: "users_id"
  has_one_attached :image, dependent: :destroy
  has_and_belongs_to_many :teams, optional: :destroy

  scope :admins, -> { joins(:roles).where("name = 'admin'") }

  # Set user confirm
  def confirm!
    update_columns(confirmed_at: Time.current)
  end

  # Check if user confirm email
  def confirmed?
    confirmed_at.present?
  end

  # Generate toker for send in mail ad cofirm user
  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def unconfirmed?
    !confirmed?
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    UserMailer.confirmation(self, confirmation_token).deliver_now
  end

  # Get all user role name
  # @return[String]
  def role_list
    return "" if roles.empty?

    roles.map(&:name).join(", ")
  end

  # Get user full name
  # @return[String]
  def full_name
    "#{first_name} #{second_name}"
  end

  # Create special token for reset password
  # @return[String]
  def generate_password_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
  end

  # Send mail for reset password
  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  # Remove all relations
  def remove_all_relations
    articles.each do |article|
      article.delete
    end
  end

  # Check if current user is admin
  def admin?
    has_role(:admin)
  end

  private

  # Convert email to low register
  def downcase_email
    self.email = email.downcase
  end

  # After register set default role :newuser
  def assign_default_role
    add_role(:newuser) if roles.blank?
  end

  # Add for current user role admin
  def assign_admin_role
    add_role(:admin)
  end
end
