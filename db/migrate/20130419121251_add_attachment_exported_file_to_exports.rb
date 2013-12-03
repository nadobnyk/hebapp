class AddAttachmentExportedFileToExports < ActiveRecord::Migration
  def self.up
    change_table :exports do |t|
      t.attachment :exported_file
    end
  end

  def self.down
    drop_attached_file :exports, :exported_file
  end
end
