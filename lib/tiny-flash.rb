require "tiny-flash/version"

module TinyFlash
  def success(message = "", url = :back, data = {})
    respond_to do |format|
      format.html { redirect_to url, :flash => { :success => message } }
      format.json { render json: { success: true, message: message }.merge(data) }
    end
  end

  def notice(message = "", url = :back, data = {})
    respond_to do |format|
      format.html { redirect_to url, :flash => { :notice => message } }
      format.json { render json: { success: true, message: message }.merge(data) }
    end
  end

  def error(message = "", url = :back, data = {})
    respond_to do |format|
      format.html { redirect_to url, :flash => { :error => message } }
      format.json { render json: { success: false, message: message }.merge(data) }
    end
  end

  def exception(exception, message = "", url = :back)
    ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver rescue nil
    error(message, url)
  end

  def error_for(resource, url = :back)
    error(resource.errors.full_messages, url)
  end

  def keep_success(message = "", url = :back, data = {})
    flash[:success] = message
    flash.keep
    success(message, url, data)
  end

  def keep_error(message = "", url = :back, data = {})
    flash[:error] = message
    flash.keep
    error(message, url, data)
  end

  def keep_error_for(resource, url = :back)
    keep_error(resource.errors.full_messages, url)
  end
end
