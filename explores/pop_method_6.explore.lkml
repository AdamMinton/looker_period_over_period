include: "/views/pop_method_6.view.lkml"

explore: order_items_method_6 {
  label: "PoP Method 6: Compare Two Arbitrary Date Ranges"
  always_filter: {
    filters: [first_period_filter: "NOT NULL", second_period_filter: "NOT NULL", period_selected: "-NULL"]
  }
}
