# frozen_string_literal: true

class FrontendController < ApplicationController
  skip_before_action :doorkeeper_authorize!

  def index
    path = File.join(Rails.root, 'public', 'index.html')
    html = File.read(path)
    render html: html.html_safe
  end
end
