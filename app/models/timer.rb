class Timer < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :status, :in => %w(pomo break long_break),
    :message => "%{value} não é um tipo valido"

  def is_pomo?
    return true if self.status == "pomo"
  end

  def is_break?
    return true if self.status == "break"
  end

  def is_long_break?
    return true if self.status == "long_break"
  end
end