/**
 * option.js
 */



$(document).ready(function() {
	//console.log('ready');

	optionAdd();
});

function optionAdd() {
	console.log('optionadd');
	var optionIndex = 1;
	$("#optionAdd_btn").click(function() {
						console.log('옵션추가');
						$("#optionIndex").append(
												 "<div class='form-group' style='margin: 13px;'>"
												//+ "<input type='text' placeholder='옵션' class='form-control input-lg'  style='float:left;' name='item_option' id='item_option'>"
												+ "<input type='text' placeholder='옵션'  style='float:left;' name='item_option' id='item_option'>"
												+ "<button type='button' onclick='option_del(this)' style='float:right;' id='optionDelBtn' name='optionDelBtn' class='btn btn-default btn-sm'>삭제</button>"
												+ "<form:errors cssClass='err' path='item_option' /><br></div>"
						);
					});
}
	function option_del(DelBtn){
		$(DelBtn).parent().remove();
	}