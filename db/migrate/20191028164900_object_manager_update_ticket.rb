class ObjectManagerUpdateTicket < ActiveRecord::Migration[4.2]
  def up

    # return if it's a new setup
    return if !Setting.find_by(name: 'system_init_done')

    ObjectManager::Attribute.add(
      force:       false,
      object:      'Ticket',
      name:        'alert',
      display:     'alert',
      data_type:   'input',
      data_option: {
        type:      'text',
        maxlength: 2000,
        null:      true,
        translate: false,
      },
      editable:    true,
      active:      true,
      screens:     {
        create_middle: {
          '-all-' => {
            null: false,
          },
        },
        edit:       {},
      },
      to_create:   false,
      to_migrate:  false,
      to_delete:   false,
      position:    101,
    )

    ObjectManager::Attribute.add(
      force:       false,
      object:      'Ticket',
      name:        'repeat_count',
      display:     'repeat_count',  
      data_type:   'integer',
      data_option: {
        maxlength: 150,
        null:      true,
        note:      'The number of the same alerts fired',
        min:       0,
        max:       999_999_999,
      },
      editable:    true,
      active:      true,
      screens:     {
        create_middle: {
          '-all-' => {
            null: false,
          },
        },
        edit:       {},
      },
      to_create:   false,
      to_migrate:  false,
      to_delete:   false,
      position:    102,
    )

  end

end
