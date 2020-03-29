class Form::PlanTiming < PlanTiming
  # concernsに作成した各termの細分化のメソッドを読み込み
  include DatetimeIntegratable

  # 変更可能な値を定義
  REGISTRABLE_ATTRIBUTES = [:first_term, :second_term, :third_term, :forth_term, :first_term_date, :first_term_hour, :first_term_minute, :second_term_date, :second_term_hour, :second_term_minute, :third_term_date, :third_term_hour, :third_term_minute, :forth_term_date, :forth_term_hour, :forth_term_minute, :post_id].freeze
  # それぞれのtermがDatetimeIntegratable内で何を表すか定義
  integrate_first_datetime_fields :first_term
  integrate_second_datetime_fields :second_term
  integrate_third_datetime_fields :third_term
  integrate_forth_datetime_fields :forth_term

  # 分解した値をすべてpresence:trueに
  validates :first_term_date, presence: true
  validates :first_term_hour, presence: true
  validates :first_term_minute, presence: true
  validates :second_term_date, presence: true
  validates :second_term_hour, presence: true
  validates :second_term_minute, presence: true
  validates :third_term_date, presence: true
  validates :third_term_hour, presence: true
  validates :third_term_minute, presence: true
  validates :forth_term_date, presence: true
  validates :forth_term_hour, presence: true
  validates :forth_term_minute, presence: true
end
