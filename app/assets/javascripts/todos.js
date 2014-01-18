$(document).ready(function() {
  $(".datepicker").each(function() {
    $(this).datepicker({
      showButtonPanel: true,
      dateFormat: "yy-mm-dd"
    });
  });
  $("input[type='submit']").each(function() {
    $(this).click(function(e) {
      button = e.currentTarget;
      form = button.form;

      if (button.value == "Create") {
        create_todo(form.id);
      }
      else if (button.value == "Save") {
        update_todo(form.id);
      }
      else if (button.value == "Delete") {
        delete_todo(form.id);
      }
      else {

      }
    });
  });
});

function create_todo(form_id) {
  $.create(
    '/todos',
    $("#"+form_id).serialize(),
    function (response) {
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

      alert('successfully added todo.');
    }
  );
}

function update_todo(form_id) {
  todo_id = form_id.match(/\d+$/);

  $.update(
    '/todos/'+todo_id,
    $("#"+form_id).serialize(),
    function (reponse) {
      alert('successfully updated todo.');
    }
  );
}

function delete_todo(form_id) {
  todo_id = form_id.match(/\d+$/);
  $.destroy({
    url: '/todos/'+todo_id,
    success: function (response) {
      alert('successfully deleted task.');
    }
  });
}
