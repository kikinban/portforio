class Post < ApplicationRecord
    # ---- バリデーション設定 ----
    validates :date, :time, :learning_plan, :learning_content, :understandable, :it_took_time, :something_felt, :notices, :tomorrow,
    {presence: true}

    default_scope -> { order(date: :asc)}
   
end
