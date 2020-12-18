module Admin::MessagesHelper
  def display_text(message)
    return 'Show' if message.hidden?

    'Hide'
  end
end
