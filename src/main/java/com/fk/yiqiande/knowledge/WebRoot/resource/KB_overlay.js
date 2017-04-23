/* CAP_81 Manage search overlay */

function KB_overlay_show(overlayid)
{
	if (overlayid === undefined)
		overlayid = 'KB_search_overlay';
	
	if (!$('#' + overlayid).length)
	{
		$('<div id="' + overlayid + '"></div>').appendTo($('#mainWrapper'));
	}
	$('#' + overlayid).show();
}

function KB_overlay_hide(overlayid)
{
	if (overlayid === undefined)
		overlayid = 'KB_search_overlay';
	
	$('#' + overlayid).hide();
}
