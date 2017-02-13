class FilesController < ApplicationController
  skip_before_action :authenticate_user!

  include ActionController::Live

  def big_transfer
    headers['X-Accel-Buffering'] = 'no' # Stop NGINX from buffering
    headers["Cache-Control"] = "no-cache" # Stop downstream caching
    headers["Transfer-Encoding"] = "chunked" # Chunked response header
    headers.delete("Content-Length") # See one line above

    respond_to do |format|
      format.html { render stream: true, layout: false }
      format.csv { render stream: true, layout: false }
    end
  end

  def big_transfer_file
    send_file '/app/app/views/files/huge_file.csv', :type => 'text/csv; charset=utf-8'
  end
end
