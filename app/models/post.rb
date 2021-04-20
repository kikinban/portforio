class Post < ApplicationRecord
    # ---- バリデーション設定 ----
    validates :time, :learning_plan, :learning_content, :it_took_time, :something_felt, :notices, :tomorrow,
    {presence: true}
   
end
