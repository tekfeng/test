class MtqSlot < ActiveRecord::Base
  def self.mtq_slot_all_date
    array = []
		MtqSlot.all.each do |entry|
      date = entry.date.strftime("%Y-%m-%d") if entry.date
      string = "{ title: 'Available #{entry.available_slot}', start: '#{date}'}"
      if entry.available_slot and entry.available_slot > 0
        array << string
      end
    end
    return array
  end
  
  def self.available_slot_in_this_month   
    MtqSlot.where("MONTH(date) = #{Time.now.month} and YEAR(date) = #{Time.now.year} and DAY(date) >= #{Time.now.day}").sum(:available_slot)
  end
  
  def self.available_slot_in_next1_month
    month = (DateTime.now + 1.month).month
    year = (DateTime.now + 1.month).year
    MtqSlot.where("MONTH(date) = #{month} and YEAR(date) = #{year}").sum(:available_slot)
  end
  
  def self.available_slot_in_next2_month
    month = (DateTime.now + 1.month +  1.month).month
    year = (DateTime.now + 1.month + 1.month).year
    MtqSlot.where("MONTH(date) = #{month} and YEAR(date) = #{year}").sum(:available_slot)
  end
  
  
end
