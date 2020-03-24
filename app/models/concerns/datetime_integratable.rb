# concernsではrailsの共通部分をまとめる役割
module DatetimeIntegratable
  extend ActiveSupport::Concern

  included do
    after_initialize :initialize_integrate_datetime

    # first_termなどの月日時分を月日、時、分に分解
    def initialize_integrate_datetime
      # attributeには月日、時、分が入る
      self.class.datetime_integrate_targets.each do |attribute|
        # next unless はunless以降がfalseなら,残りの処理を行わずに次のループ処理に進む
        next unless respond_to?(attribute.to_s)

        original_date = send(attribute.to_s)
        # next if はif以降がtrueなら、残りの処理を行わずに次のループ処理に進む
        next if original_date.nil?

        # keyには月日、時、分が入る。formatにはTimeクラスのstrftimeメソッドが入る
        [['date', '%Y/%m/%d'], ['hour', '%H'], ['minute', '%M']].each do |key, format|
          next if send("#{attribute}_#{key}").present?

          send("#{attribute}_#{key}=", original_date.strftime(format))
        end
      end
    end
  end

  module ClassMethods
    attr_accessor :datetime_integrate_targets

    # 通知時間のfirst_termの値の解体
    def integrate_first_datetime_fields(*attributes)
      self.datetime_integrate_targets = attributes
      attributes.each do |attribute|
        send(:attr_accessor, "#{attribute}_date")
        send(:attr_accessor, "#{attribute}_hour")
        send(:attr_accessor, "#{attribute}_minute")
      end
    end

    # 通知時間のsecond_termの値の解体
    def integrate_second_datetime_fields(*attributes)
      self.datetime_integrate_targets = attributes
      attributes.each do |attribute|
        send(:attr_accessor, "#{attribute}_date")
        send(:attr_accessor, "#{attribute}_hour")
        send(:attr_accessor, "#{attribute}_minute")
      end
    end

    # 通知時間のthird_termの値の解体
    def integrate_third_datetime_fields(*attributes)
      self.datetime_integrate_targets = attributes
      attributes.each do |attribute|
        send(:attr_accessor, "#{attribute}_date")
        send(:attr_accessor, "#{attribute}_hour")
        send(:attr_accessor, "#{attribute}_minute")
      end
    end

    # 通知時間のforth_termの値の解体
    def integrate_forth_datetime_fields(*attributes)
      self.datetime_integrate_targets = attributes
      attributes.each do |attribute|
        send(:attr_accessor, "#{attribute}_date")
        send(:attr_accessor, "#{attribute}_hour")
        send(:attr_accessor, "#{attribute}_minute")
      end
    end
  end
end
