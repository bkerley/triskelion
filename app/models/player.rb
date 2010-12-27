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
    digest = colorcode_digest
    r = (digest[0..1].to_i(16) >> 1) + 127
    g = (digest[2..3].to_i(16) >> 1) + 127
    b = (digest[4..5].to_i(16) >> 1) + 127
    "##{r.to_s 16}#{g.to_s 16}#{b.to_s 16}"
  end
end
