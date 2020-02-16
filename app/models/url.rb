class Url < ApplicationRecord
  before_save :set_uuid

  def set_uuid
    return if uuid

    uuid = new_uuid

    while self.class.find_by(uuid: uuid)
      uuid = new_uuid
    end

    self.uuid = uuid
  end

  def new_uuid
    (0..7).map do |i|
      bytes[rand(bytes.size)].chr
    end.join
  end

  def bytes
    nums   = (48..57).to_a
    az_up  = (65..90).to_a
    az_min = (97..122).to_a

    (nums + az_up + az_min)
  end
end
