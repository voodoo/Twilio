#--
# Field Set Form Builder
# by Nicholas Cancelliere (www.ozmox.com)
#
# Copyright (c) 2009
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

# create a +label+ and +input+ fieldset, wrapped inside a div tag, for use with forms
# also includes placing error messages next to input
class FieldSetFormBuilder < ActionView::Helpers::FormBuilder
  
  REQUIRED_MARK = ' *'
  
  helpers = field_helpers + %w(date_select datetime_select time_select collection_select select country_select time_zone_select) - %w(hidden_field label fields_for)
  
  #-- 
  # here we dynamically builds helper methods using the helper array above                                                                   
  #++
  helpers.each do |name|
    define_method(name) do |field, *args|
      options = args.last.is_a?(Hash) ? args.pop : {}
      build_shell(field, options) do
        super
      end
    end
  end
  
  # builds out the html for use as field sets
  def build_shell(field, options)
    options[:label] = options[:label].blank? ? fieldset_label(field, options)  : options[:label]
    if has_errors_on?(field)
      @template.content_tag(:div, label(field, options[:label].concat(required_mark(field) )) + yield + "<div class='inline_error_message'>#{error_message(field,options)}</div>", :class => 'fieldset')
    else
      @template.content_tag(:div, label(field, options[:label].concat(required_mark(field) )) + yield, :class => 'fieldset')
    end
  end
  
  # evaluates if a field has errors and returns a +boolean+ value
  def has_errors_on?(field)
    !(object.nil? || object.errors.on(field).blank?)    
  end
  
  # builds error message if there are errors on the field, and uses sentance-style formatting if more than one
  def error_message(field, options)
    if has_errors_on?(field)
      errors = object.errors.on(field)
      errors.is_a?(Array) ? errors.to_sentence : errors
    else
      ''
    end    
  end
  
  
  private
  
  def fieldset_label(field, options)
    field = field.to_s.humanize
    options[:titleize] == false ? field : field.titleize
  end
  
  def required_mark(field)
    required_field?(field) ? REQUIRED_MARK : ''
  end
  
  def required_field?(field)
    @object_name.to_s.camelize.constantize.reflect_on_validations_for(field).map(&:macro).include?(:validates_presence_of)
  end
  
  
end
