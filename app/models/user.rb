class User < ActiveRecord::Base
  # Authlogic configuration block is optional, example: acts_as_authentic { |c| c.my_config_option = my_value }
  acts_as_authentic
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :bio

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
