class Volunteer < ApplicationRecord

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :name
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX
end
