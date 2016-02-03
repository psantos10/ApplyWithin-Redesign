module ImpressionsHelper
  def record_application_impression(application)
    raw <<-EOS
  <input type="hidden"
    data-trackable-id="#{application.id}"
    data-trackable-type="PositionApplication"
    class="record_impression" />
EOS
  end
end
