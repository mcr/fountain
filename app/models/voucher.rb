class Voucher < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :node
  belongs_to :voucher_request

  class VoucherFormatError < Exception
  end

  def self.from_voucher(type, value)
    voucher = create(signed_voucher: value)

    case type
    when :pkcs7
      voucher.details_from_pkcs7
    end
    voucher
  end

  def details_from_pkcs7
    begin
      @cvoucher = Chariwt::Voucher.from_pkcs7(signed_voucher)
    rescue ArgumentError
      # some kind of pkcs7 error?
      raise VoucherFormatError
    end

    self.nonce = @cvoucher.nonce
    self.details = @cvoucher.attributes
    self.device_identifier = @cvoucher.serialNumber
    self.expires_at        = @cvoucher.expiresOn
    self.node            = Node.find_or_make_by_number(device_identifier)
    self.manufacturer    = node.manufacturer
    save!
  end

  def serial_number
    details.serialNumber
  end

  def owner_cert
    @owner
  end

end
