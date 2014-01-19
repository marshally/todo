$(document).ready(function() {
  $(".datepicker").each(function() {
    $(this).datepicker({
      showButtonPanel: true,
      dateFormat: "yy-mm-dd"
    });
  });
  $("input[type='submit']").on("click", handle_click);
  $("#priority_header").click(function() {
    toggle_sort_order("priority");
    sort("priority");
  });
  $("#due_date_header").click(function() {
    toggle_sort_order("due_date");
    sort("due_date");
  });
  $("input.datepicker,input#todo_priority").each(function() {
    form = $(this).parent().parent();
    if (form.attr("id") !== "new_todo") {
      form.addClass("sortable");
    }
  });
});

function handle_click(e) {
  button = e.currentTarget;
  form = button.form;

  if (button.value === "Create") {
    create_todo(form.id);
  } else if (button.value === "Save") {
    update_todo(form.id);
  } else if (button.value === "Delete") {
    delete_todo(form.id);
  } else {
    alert("You clicked an unknown button - " + button.value);
  }
}

function create_todo(form_id) {
  $.create({
    url: '/todos',
    data: $("#"+form_id).serialize(),
    error: function(response) {
      $("#new_todo>div.error").html(response.responseText);
      $("#new_todo").effect("highlight", {color: 'red'}, 3000);
    },
    success: function (response) {
      created = $("#new_todo_0").clone();
      id = "edit_todo_"+response.id;
      created.attr("id", id);
      $("#new_todo>div>input").each(function(e) {
        if (this.name.substring(0, 4) === "todo") {
          created.find("input[name='"+this.name+"']")[0].value = this.value;
          this.value = "";
        }
      });
      created.insertBefore("#new_todo");
      created.effect("highlight", 1000);
      $("input[type='submit']").on("click", handle_click);
      $("#new_todo>div.error").html("");
      sort(window.order_by);
    }
  });
}

function update_todo(form_id) {
  todo_id = form_id.match(/\d+$/);

  $.update({
    url: '/todos/'+todo_id,
    data: $("#"+form_id).serialize(),
    success: function (response) {
      $("#"+form_id+">div.error").html("");
      $("#"+form_id).effect("highlight", 1000);
      sort(window.order_by);
      // there is a bug in sorting where if you update a record it doesn't
      // ever sort to the right place.
    },
    error: function (response) {
      $("#"+form_id+">div.error").html(response.responseText);
      $("#"+form_id).effect("highlight", {color: 'red'}, 3000);
    }
  });
}

function delete_todo(form_id) {
  todo_id = form_id.match(/\d+$/);
  $.destroy({
    url: '/todos/'+todo_id,
    success: function (response) {
      $("#"+form_id).remove();
    }
  });
}

function sort(field) {
  // see http://tinysort.sjeiti.com/ for sorting syntax
  if (field === "priority") {
    selector = "input#todo_priority";
  } else if (field === "due_date") {
    selector = "input.datepicker";
  } else { return; }
  $('div.table>form.sortable').tsort(selector, {order:window.order,useVal:true});
}

function toggle_sort_order(field) {
  if (window.order_by === field && window.order === "desc") {
    window.order_by = field;
    window.order = "asc";
  } else {
    window.order_by = field;
    window.order = "desc";
  }
  return window.order;
}
