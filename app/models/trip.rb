class Trip < ActiveRecord::Base
  attr_accessible :name, :from_date, :to_date
  validates_presence_of :name

  validate :from_date_before_to_date

  def from_date_before_to_date
    if (from_date && to_date)
      errors.add :from_date, 'is not a valid date' if  from_date > to_date
    end
  end
  

  belongs_to :user
end
