class GuestUser

  def admin_for?(resource)
    false
  end

  def group
    nil
  end

  def email
    ""
  end

  def hunter?
    false
  end

  def business?
    false
  end
end
