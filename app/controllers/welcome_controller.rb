class WelcomeController < ApplicationController
  def index
    p "Number of methods"
    p WelcomeController.methods.count
    p ApplicationController.superclass.superclass.superclass.superclass
  end
end
