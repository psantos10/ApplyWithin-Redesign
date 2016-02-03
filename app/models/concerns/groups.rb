module Groups

  VALID_GROUPS = %i[hunter business]

  def group=(val)
    raise_if_invalid_group(val)
    group_from_value(val).create!(user: self)
  end

  def group
    @group ||= Hunter.where(user_id: self.id)[0] ||
                Business.where(user_id: self.id)[0]
  end

  VALID_GROUPS.each do |g|
    define_method "#{g}?" do
      g == group.class.to_s.underscore.to_sym
    end
  end

private

  def raise_if_invalid_group(val)
    raise RuntimeError.new(:invalid_group) unless VALID_GROUPS.include? val.to_sym
  end

  def group_from_value(val)
    val.to_s.capitalize.constantize
  end
end
