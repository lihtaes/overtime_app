class StaticController < ApplicationController
  def homepage
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.where(status: 'submitted')
      @recent_audit_items = AuditLog.last(10)
    else
    #something
    end
  end
end