class StudyRecord < ApplicationRecord
    # ---- バリデーション設定 ----
    validates :date, :time, :minute, :learning_plan, :learning_content, :understandable, :it_took_time, :something_felt, :notices, :tomorrow,
    {presence: true}

    default_scope -> { order(date: :asc)}
    
    def previous
        StudyRecord.where("date < ?",date).order("date DESC").first
    end
    def next
        StudyRecord.where("date > ?",date).order("date ASC").first
    end
end
