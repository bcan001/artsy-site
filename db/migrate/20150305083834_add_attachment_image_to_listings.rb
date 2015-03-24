class AddAttachmentImageToListings < ActiveRecord::Migration

	# first we uploaded our images directly from our computer, then we changed it so we have our images hosted on dropbox.com
  def self.up
    change_table :listings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :listings, :image
  end
end
