module FieldSetForm
  def fieldset_form_for(record_or_name_or_array, *args, &proc)
    options = args.detect { |arg| arg.is_a?(Hash) }
    if options.nil?
      options = { :builder => FieldSetFormBuilder }
      args << options
    else
      options[:builder] = FieldSetFormBuilder
    end
    form_for(record_or_name_or_array, *args, &proc)
  end
end

ActionView::Base.send(:include, FieldSetForm)