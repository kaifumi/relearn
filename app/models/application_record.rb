class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  # typeカラムをActiveRecordで使用するために必要
  self.inheritance_column = :_type_disabled
  
end
