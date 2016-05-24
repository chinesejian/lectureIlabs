module ApplicationHelper

  def check_admin_status
    if current_user != nil
      return
    else
      flash[:error] = "The section you requested is for admins only."
      redirect_to root_url and return
    end
  end

	 def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.fetch(flash_type.to_sym, nil)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message 
      end)
    end
    nil
  end
end
