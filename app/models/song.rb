class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validate :release_year_validation

  def release_year_validation
    if released  
      if release_year.nil?
        errors.add(:release_year, "Please add release_year")
      elsif release_year > Date.today.year 
        errors.add(:release_year, "Must be less than or equal to the current year") 
      end
    end
  end
end
