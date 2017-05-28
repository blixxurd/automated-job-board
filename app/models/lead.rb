class Lead < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true, format: {with: EMAIL_REGEX}
  before_save :downcase_email!


  def downcase_email!
    self.email.downcase!
  end

end
