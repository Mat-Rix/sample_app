# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :email, :name, :password, :password_confirmation

  email_regex = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,4})$/i

  validates :name,   :presence => true,
                     :length => { :maximum => 50 }

  validates :email,  :presence => true, :length => { :maximum => 50 },
                     :format => { :with => email_regex},
                     :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40 }

end
