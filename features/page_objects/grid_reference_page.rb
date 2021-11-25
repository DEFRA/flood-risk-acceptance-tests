# frozen_string_literal: true

class GridReferencePage < BasePage

  element(:grid_reference, "input#site-grid-reference-form-temp-grid-reference-field")
  element(:description, "#site-grid-reference-form-temp-site-description-field")
  element(:dredging_length, "input#site-grid-reference-form-dredging-length-field")

  def submit(args = {})
    grid_reference.set(args[:grid_reference]) if args.key?(:grid_reference)
    description.set(args[:description]) if args.key?(:description)
    dredging_length.set(args[:dredging_length]) if args.key?(:dredging_length)
    submit_button.click
  end

end
