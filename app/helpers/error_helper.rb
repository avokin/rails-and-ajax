module ErrorHelper
  def error_messages_for(object)
    messages = Array.new
    object.errors.messages.each {|key, value| messages << "\"#{key.to_s}\"" + ":" + "\"#{value.join(',')}\""}
    messages.join(",")
  end
end