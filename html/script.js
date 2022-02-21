$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
    display(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
})


$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27:
            kapat();
            break;
    }
});

kapat = function() {
    $("#container").fadeOut(175);
    $.post('http://fivemac-users/close');
}

window.addEventListener('message', (event) => {
    let data = event.data
    if (data.action == 'fivemac') {
        setTimeout(function() {
            let html = "";
            html += `
            <tr style="text-align: center;" data-id="1" class="marked">
            <td style="text-align: center;">[${data.id}]<i class="checkbox fa fa-square-o"></i></td>
            <td style="text-align:center;">${data.identifier}</td>
            <td style="text-align:center;">${data.accounts}</td>
            <td style="text-align:center;">${data.group}</td>
            <td style="text-align:center;">${data.inventory}</td>
            <td style="text-align:center;">${data.name}</td>
            <td style="text-align:center;">${data.lastname}</td>
            <td></td>
            </tr>
            `
            $(".dataTable table").append(html);
        }, 500);
    }
})
