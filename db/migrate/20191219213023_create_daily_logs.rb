class CreateDailyLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_logs do |t|
      t.string :note
      t.timestamps
    end

    [
      "This is my last day on the marketing-infra team. Excited to start on LWoD.",
      "Before starting on LWoD, it'll be useful to write down learnings from the previous year."
    ].each do |s|
      DailyLog.create!(note: s)
    end
  end
end
