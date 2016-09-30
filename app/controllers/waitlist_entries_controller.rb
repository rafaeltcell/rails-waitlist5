class WaitlistEntriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @waitlist_entries = WaitlistEntry.all
    @waitlist_entries.find_by(email: "wait@gmail.com")
  end

  def create
    @whitelist_entry = WaitlistEntry.new(params.require(:waitlist_entry).permit(:email))

    @whitelist_entry.save

    redirect_to waitlist_entries_path
  end

end
