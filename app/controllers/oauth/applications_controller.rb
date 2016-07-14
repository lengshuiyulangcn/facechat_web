class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  include Authentification
  before_filter :authenticate
end
