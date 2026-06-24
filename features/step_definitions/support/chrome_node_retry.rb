# frozen_string_literal: true

# Chrome 147 compatibility patches (project-specific).
# Stale node retries are handled by Quke's env.rb.
#
# 1. JSON viewer: Chrome renders application/json responses with a built-in
#    viewer that does not include <pre> elements. Firefox wraps raw JSON in
#    <pre>. When a "pre" element is not found, this patch injects one via JS.
#

return unless Quke::Quke.config.driver == "chrome"

# --- 1. Inject <pre> for Chrome's JSON viewer ---
module ChromeJsonPreInjector
  def find(*args, **kwargs, &)
    super
  rescue Capybara::ElementNotFound
    raise unless args.first.to_s == "pre"

    inject_pre_from_json
    super
  end

  private

  def inject_pre_from_json
    session.execute_script(<<~JS)
      if (!document.querySelector('pre')) {
        var raw = document.body.innerText;
        document.body.innerHTML = '<pre>' + raw.replace(/</g, '&lt;') + '</pre>';
      }
    JS
  end
end

Capybara::Node::Document.prepend(ChromeJsonPreInjector)
