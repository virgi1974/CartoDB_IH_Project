module ApplicationHelper

   def flash_message
    check_flash(:alert) || check_flash(:notice)
  end

  private
  def check_flash type
      content_tag :div, class: type do
        content_tag :p do
          flash[type]
        end
      end
  end

end
