class Timer < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :status, :in => %w(pomo break long_break),
    :message => "%{value} não é um tipo valido"

end