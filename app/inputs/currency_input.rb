class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    "<div class=\"flexbox flexbox-align-bottom\"> \
      #{@builder.text_field(attribute_name, merged_input_options)} \
      <div class=\"input-addon-right\"> \
        <i class=\"fas fa-euro-sign fa-lg\"></i> \
      </div> \
    </div> \
    ".html_safe
  end
end
