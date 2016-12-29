class GridReferencePage < SitePrism::Page

  element(:grid_reference, "input#grid_reference_grid_reference")
  element(:description, "textarea[name='grid_reference[description]']")
  element(:dredging_length, "input#grid_reference_dredging_length")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    grid_reference.set(args[:grid_reference]) if args.key?(:grid_reference)
    description.set(args[:description]) if args.key?(:description)
    dredging_length.set(args[:dredging_length]) if args.key?(:dredging_length)

    submit_button.click
  end

end
