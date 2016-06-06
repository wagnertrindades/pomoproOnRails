class Timer < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :status,
    :in => %w(pomo break long_break),
    :message => "%{value} não é um tipo valido"

  def is_pomo?
    status_equals? "pomo"
  end

  def is_break?
    status_equals? "break"
  end

  def is_long_break?
    status_equals? "long_break"
  end

  private

  def status_equals?(value)
    return true if self.status == value
  end
end
