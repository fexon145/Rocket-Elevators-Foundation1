class DropboxController < ApplicationController
    # consumer = Dropbox::API::OAuth.consumer(:authorize)
    # request_token = consumer.get_request_token
    # # Store the token and secret so after redirecting we have the same request token
    # session[:token] = request_token.token
    # session[:token_secret] = request_token.secret
    # request_token.authorize_url(:oauth_callback => 'http://localhost:3001/callback')
    # # Here the user goes to Dropbox, authorizes the app and is redirected
    # # This would be typically run in a Rails controller
    # hash = { oauth_token: session[:token], oauth_token_secret: session[:token_secret]}
    # request_token  = OAuth::RequestToken.from_hash(consumer, hash)
    # oauth_verifier = params[:oauth_verifier]
    # result = request_token.get_access_token(:oauth_verifier => oauth_verifier)
    
    # client = Dropbox::API::Client.new("zq-PMuGwkRcAAAAAAAAAAYG3Sb4cd65pVGLn4aEBAbGK9D57Vpxnz0QXrM-JAY2o")

end