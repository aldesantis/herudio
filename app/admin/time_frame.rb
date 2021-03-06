# frozen_string_literal: true
ActiveAdmin.register TimeFrame do
  decorate_with TimeFrameDecorator

  menu parent: 'Corsi'

  filter :starts_at
  filter :ends_at

  permit_params(
    :starts_at_date, :starts_at_time_hour, :starts_at_time_minute, :ends_at_date,
    :ends_at_time_hour, :ends_at_time_minute, :group_id
  )

  index do
    selectable_column
    id_column

    column :group
    column :starts_at
    column :ends_at

    actions
  end

  show do |time_frame|
    panel t('activeadmin.time_frame.panels.details') do
      attributes_table_for time_frame do
        row :id
        row :group
        row :starts_at
        row :ends_at
      end
    end
  end

  form do |f|
    f.inputs t('activeadmin.time_frame.panels.details') do
      f.input :group
      f.input :starts_at, as: :just_datetime_picker
      f.input :ends_at, as: :just_datetime_picker
    end

    f.actions
  end
end
