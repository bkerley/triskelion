class Player < ActiveRecord::Base
  has_many :rolls
  has_many :chats

  def tripcode_digest
    [Digest::SHA1.digest(self.tripcode)].pack('m').tr('+/','-_')[0..7]
  end

  def colorcode_digest
    Digest::SHA1.hexdigest(self.tripcode+self.name)
  end

  def chat_color
    ccode = "#9" + colorcode_digest[0,3][0]
    ccode += "9" + colorcode_digest[0,3][1]
    ccode += "9" + colorcode_digest[0,3][2]
    return ccode;
  end
end
