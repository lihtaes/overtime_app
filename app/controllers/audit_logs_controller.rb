class AuditLogsController < ApplicationController

  def index 
    @audit_logs = AuditLog.page(params[:page]).per(15)
    authorize @audit_logs
  end

  def confirm
    audit_log = AuditLog.find(params[:id])
    authorize audit_log
    audit_log.confirmed!
    audit_log.update!(end_date: Date.today)
    redirect_to root_path, notice: "Thank you, your confirmation has been successfully made."
  end


end
