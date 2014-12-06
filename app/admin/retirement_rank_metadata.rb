ActiveAdmin.register RetirementRankMetadata do

  config.filters = false
  menu :priority => 10, :label => "Retirement Rank Metadata"
  permit_params :lower_age, :upper_age, :savings_multiplier
  config.sort_order = "lower_age_asc"

  index do
    selectable_column
    id_column
    column :lower_age
    column :upper_age
    column :savings_multiplier
    actions
  end

  action_item :only => :show do
    link_to('New Age Slot', new_admin_retirement_rank_metadatum_path)
  end

  form do |f|
    f.inputs "Retirement Rank Metadata" do
      f.input :lower_age
      f.input :upper_age
      f.input :savings_multiplier
    end
    f.actions
  end
  

end
