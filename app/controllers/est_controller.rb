class EstController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # GET /.well-known/est/requestvoucher
  def requestvoucher
    token = Base64.decode64(request.body.read)
    @voucherreq = VoucherRequest.from_pkcs7_withoutkey(token)

    clientcert_pem = request.env["SSL_CLIENT_CERT"]
    if clientcert_pem
      @voucherreq.tls_clientcert = clientcert_pem
    end
    @voucherreq.discover_manufacturer
    @voucherreq.save!

    @voucher = @voucherreq.get_voucher

    render :text => @voucher.base64_signed_voucher,
           :context_type => 'application/pkcs7-mime; smime-type=voucher'
  end


  private

end
