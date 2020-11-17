ActiveAdmin.register Article do
  permit_params :title, :text, :image, :author, :readingtime, :date

  filter :title
  filter :text
  filter :image
  filter :author
  filter :date
  filter :readingtime

  index do
    selectable_column
    column :id
    column :title
    column :text
    column :image
    column :readingtime
    column :date
    actions
  end

  form  do |f|
    f.inputs do
      f.input :title
      f.input :text
      f.input :image, as: :file
      f.input :readingtime
      f.input :date, as: :datepicker
    end
    f.actions
  end

end
