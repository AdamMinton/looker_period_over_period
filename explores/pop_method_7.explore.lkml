include: "/views/pop_method_7.view.lkml"

explore: order_items_method_7 {
  label: "PoP Method 7: Arbitrary Period and Directly Previous Period"
  always_filter: {
    filters: [date_filter: "last 30 days"]
  }
  sql_always_where: ${timeframes} <> 'Not in time period' ;;
}
