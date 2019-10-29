class ObjectManagerUpdateTicket < ActiveRecord::Migration[4.2]
  def up

    # return if it's a new setup
    return if !Setting.find_by(name: 'system_init_done')
    
    UserInfo.current_user_id = 1
    ObjectManager::Attribute.add(
      force:       true,
      object:      'Ticket',
      name:        'alert',
      display:     'alert',
      data_type:   'input',
      data_option: {
        default:    '',  
        type:      'text',
        maxlength: 2000,
        null:      false,
        translate: false,
      },
      editable:    false,
      active:      true, 
      screens: {
        create_middle: {},
        edit: {},        
      },
      to_create:   false,
      to_migrate:  false,
      to_delete:   false,
      position:    101,  
    )

    ObjectManager::Attribute.add(
      force:       true,
      object:      'Ticket',
      name:        'repeat_count',
      display:     'repeat count',  
      data_type:   'integer',
      data_option: {
        default:    0, 
        maxlength: 150,
        null:      false,
        note:      'The number of the same alerts fired',
        min:       0,
        max:       999_999_999,
      },
      editable:    false,
      active:      true,
      screens:     {
        create_middle: {},
        edit: {
         'ticket.customer' => {
            shown: true,                           
          },
           'ticket.agent' => {
             shown: true,
             },
         },    
      },
      to_create:   false,
      to_migrate:  false,
      to_delete:   false,
      position:    102,
    )
    
  end
end
