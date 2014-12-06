ActiveAdmin.register IncomeRankMetadata do

  config.filters = false
  menu :priority => 9, :label => "Income Rank Metadata"
  permit_params :lower_income, :upper_income, :percentage, :percentage_below
  config.sort_order = "lower_income_asc"

  index do
    selectable_column
    id_column
    column :lower_income
    column :upper_income
    column :percentage
    column :percentage_below
    actions
  end

  action_item :only => :show do
    link_to('New Income Slot', new_admin_income_rank_metadatum_path)
  end

  form do |f|
    f.inputs "Income Rank Metadata" do
      f.input :lower_income
      f.input :upper_income
      f.input :percentage
      f.input :percentage_below
    end
    f.actions
  end
  

end
