module UuidHelper
  extend ActiveSupport::Concern

  included do
    def to_param
      uuid
    end

    private

    before_create :set_uuid

    def set_uuid
      self.uuid = SecureRandom.uuid
    end
  end
end
