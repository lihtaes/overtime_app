class AuditLogsController < ApplicationController

  def index 
    @audit_logs = AuditLog.page(params[:page]).per(15)
    authorize @audit_logs
  end

end
