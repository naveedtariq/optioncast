ActiveAdmin.register RankingData do

  config.filters = false
  menu :priority => 8, :label => "Median Net Worths"
  permit_params :lower_age, :upper_age, :median1, :median10, :median30, :median50, :median70, :median90, :median100
  config.sort_order = "lower_age_asc"

  index do
    selectable_column
    id_column
    column :lower_age
    column :upper_age
    column "1st %tile",:median1
    column "10th %tile",:median10
    column "30th %tile",:median30
    column "50th %tile",:median50
    column "70th %tile",:median70
    column "90th %tile",:median90
    column "100th %tile",:median100
    actions
  end

  action_item :only => :show do
    link_to('New Age Slot', new_admin_ranking_datum_path)
  end

  form do |f|
    f.inputs "Median Net Worths" do
      f.input :lower_age
      f.input :upper_age
      f.input :median1
      f.input :median10
      f.input :median30
      f.input :median50
      f.input :median70
      f.input :median90
      f.input :median100
    end
    f.actions
  end
  

end
