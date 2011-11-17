function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
  console.log($(link).parent().prev("div"));
  $div = $(link).parent().prev("p");
  $div.page();
  $div.removeClass("ui-page ui-body-c")
}

function add_fields_bullet_point(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
  console.log($(link).prev("div"));
  $div = $(link).prev("div");
  $div.page();
  $div.removeClass("ui-page ui-body-c")
}