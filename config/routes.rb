$ADMININTERFACE ||= ENV['ADMININTERFACE']

Rails.application.routes.draw do
  resources :administrators
  resources :devices

  # EST processing at well known URLs (pre-RFC)
  post '/.well-known/est/requestvoucher', to: 'est#requestvoucher'
  post '/.well-known/est/voucher_status', to: 'est#voucher_status'

  # EST processing at well known URLs (RFC8995)
  post '/.well-known/brski/requestvoucher', to: 'est#requestvoucher'
  post '/.well-known/brski/voucher_status', to: 'est#voucher_status'
  post '/.well-known/brski/enroll_status',  to: 'est#enroll_status'

  # These are part of RFC7030
  get  '/.well-known/est/cacerts',        to: 'est#cacerts'
  get  '/.well-known/est/csrattributes',  to: 'est#csrattributes'
  post '/.well-known/est/simpleenroll',   to: 'est#simpleenroll'

  # these are part of Smartkaklink
  post '/.well-known/est/requestvoucherrequest', to: 'smarkaklink#rvr'
  post '/.well-known/est/voucher',        to: 'smarkaklink#voucher'

  if true # was $COAPSERVER, but it does not get set early enough.
    #get '/.well-known/core',   to: 'core#index'
    post '/e/rv', to: 'est#cbor_rv', coap: true, rt: 'ace.est', short: '/e'
    post '/e/vs', to: 'est#cbor_vs', coap: true, rt: 'ace.est', short: '/e'

    # get /cacerts
    get '/e/crts', to: 'est#cbor_crts', coap: true, rt: 'ace.est', short: '/e'

    # get /att
    get  '/.well-known/brski/att', to: 'est#cbor_crts', coap: true, rt: 'ace.est', short: '/e'
    get '/e/att',  to: 'est#cbor_crts', coap: true, rt: 'ace.est', short: '/e'

    # get /sen -- simpleenroll
    get  '/.well-known/brski/sen', to: 'est#simpleenroll', coap: true, rt: 'ace.est', short: '/e'
    get '/e/sen',                  to: 'est#simpleenroll', coap: true, rt: 'ace.est', short: '/e'
  end

  resources :status,  :only => [:index ]
  resources :version, :only => [:index ]

end
