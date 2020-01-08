class DailyLogController < ApplicationController
  def index
    @daily_logs = {}
    DailyLog.all.order(created_at: :desc).each do |daily_log|
      timestamp = daily_log.created_at.strftime("%Y-%m-%d")
      @daily_logs[timestamp] ||= []
      @daily_logs[timestamp] << daily_log
    end
  end

  def create
    note = params[:note]

    Rails.logger.info "NOTE IS #{note}"
    if note.present?
      DailyLog.create!(note: note)
    end
    redirect_to action: :index
  end
end
