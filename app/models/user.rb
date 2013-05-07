# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name

  email_regex = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,4})$/i

  validates :name,   :presence => true,
                     :length => { :maximum => 50 }

  validates :email,  :presence => true, :length => { :maximum => 50 },
                     :format => { :with => email_regex},
                     :uniqueness => { :case_sensitive => false }

end
