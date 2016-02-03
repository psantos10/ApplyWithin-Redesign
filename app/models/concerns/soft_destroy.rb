module SoftDestroy
  extend ActiveSupport::Concern

  included do
    default_scope { where("#{table_name}.deleted_at IS NULL OR \
                           #{table_name}.deleted_at >= ?", DateTime.now) }

    scope :deleted, -> {
      unscoped.where("(#{table_name}.deleted_at IS NOT NULL) AND \
                      (#{table_name}.deleted_at <= ?)", DateTime.now)
    }

    extend ClassMethods
  end

module ClassMethods
    def destroy(id)
      if id.is_a?(Array)
        id.map { |one_id| destroy(one_id) }
      else
        find(id).update(deleted_at: DateTime.now)
      end
    end
    alias_method :soft_destroy, :destroy

    def destroy_all(conditions = nil)
      if conditions
        where(conditions).destroy_all
      else
        to_a.each {|object| object.update(deleted_at: DateTime.now) }.tap { reset }
      end
    end
    alias_method :soft_destroy_all, :destroy_all
  end

  def destroy
    update(deleted_at: DateTime.now)
  end

  alias_method :soft_destroy, :destroy

  def deleted?
    deleted_at.present? && deleted_at <= DateTime.now
  end
  alias_method :destroyed?, :deleted?

end
