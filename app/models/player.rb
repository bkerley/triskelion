class Player < ActiveRecord::Base
  has_many :rolls
  has_many :chats

  def tripcode_digest
    [Digest::SHA1.digest(self.tripcode)].pack('m').tr('+/','-_')[0..7]
  end
end
