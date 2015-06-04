class AddAttachmentContractFileToVendorRates < ActiveRecord::Migration
  def self.up
    change_table :vendor_rates do |t|
      t.attachment :contract_file
    end
  end

  def self.down
    remove_attachment :vendor_rates, :contract_file
  end
end
