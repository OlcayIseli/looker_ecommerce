connection: "thelook_ecommerce_data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: thecommercegit_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: thecommercegit_project_default_datagroup

explore: products {
  join: distribution_centers {
    type: left_outer 
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer 
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer 
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer 
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items1 {
  join: users {
    type: left_outer 
    sql_on: ${order_items1.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer 
    sql_on: ${order_items1.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer 
    sql_on: ${order_items1.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer 
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: distribution_centers {}

explore: events {
  join: users {
    type: left_outer 
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: order_items {
  join: users {
    type: left_outer 
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer 
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer 
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer 
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer 
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

