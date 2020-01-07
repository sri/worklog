class DailyLogController < ApplicationController
  def index
    @daily_logs = DailyLog.all.order(created_at: :desc)
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
