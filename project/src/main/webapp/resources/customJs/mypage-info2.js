
function fn_movePage(val) {
	jQuery("input[name=pageNo]").val(val);
	jQuery("form[name=pagingForm]").attr("method", "get");
	jQuery("form[name=pagingForm]").attr("action", "")[0].submit();
}