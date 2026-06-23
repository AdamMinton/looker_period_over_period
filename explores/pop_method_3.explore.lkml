include: "/views/pop_method_3.view.lkml"

explore: order_items_method_3 {
  label: "PoP Method 3: Current Period and Previous Period"
  always_filter: {
    filters: [current_date_range: "6 months", compare_to: "YEAR"]
  }
}
