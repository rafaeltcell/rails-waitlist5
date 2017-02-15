class FilesController < ApplicationController
  skip_before_action :authenticate_user!

  #include ActionController::Live

  # TODO: this doesn't work :(
  #def stream
    #response.headers["Content-Type"] = "text/event-stream"
    #100.times {
      #response.stream.write "<p>#{Time.now}</p>"
      #sleep 1
    #}
  #ensure
    #response.stream.close
  #end

  def big_transfer
    respond_to do |format|
      format.html {
        #headers["X-Accel-Buffering"] = "no"
        #headers["Cache-Control"] = "no-cache"
        #headers["Content-Type"] = "text/html; charset=utf-8"
        #headers["Transfer-Encoding"] = "chunked" # Chunked response header
        #headers.delete("Content-Length") # See one line above
        render stream: true
      }
      format.csv {
        headers["X-Accel-Buffering"] = "no"
        headers["Cache-Control"] = "no-cache"
        headers["Content-Type"] = "text/csv; charset=utf-8"
        #headers["Transfer-Encoding"] = "chunked" # Chunked response header
        #headers["Content-Disposition"] =
           #%(attachment; filename="report-#{Time.zone.now.to_date.to_s(:default)}.csv")
        #headers["Last-Modified"] = Time.zone.now.ctime.to_s
        #render stream: true, layout: false
        #self.response_body = build_csv_enumerator(header, data)
        self.response_body = Enumerator.new do |lines|
          sleep 5
          10.times do |x|
            lines << (1..10).to_a.shuffle.join(",")
          end
        end
      }
    end
  ensure
    response.stream.close
  end

  def big_transfer_file
    send_file '/app/app/views/files/huge_file.csv', :type => 'text/csv; charset=utf-8'
  end
end
