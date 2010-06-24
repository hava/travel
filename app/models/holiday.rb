class Holiday < ActiveRecord::Base
  validates_presence_of :name
  validate :from_date_before_to_date
  belongs_to :user

   def from_date_before_to_date
    if (from_date && to_date)
      errors.add :from_date, 'is not a valid date' if  from_date > to_date
    end
  end
end
