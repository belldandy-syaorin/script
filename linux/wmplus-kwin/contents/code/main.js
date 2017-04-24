var size_default = [800, 600];
var size_big = [1024, 768];
var size_large = [1280, 960];
var sizemode = 0;
var smartsize_default = [2 , 1];
var smartsize_big = [3, 2];
var smartsize_large = [5, 4];
var smartsizemode = 0;
var hsmartsize_default = [3, 1];
var hsmartsize_big = [2, 1];
var hsmartsize_large = [3, 2];
var hsmartsize_huge = [5, 4];
var hsmartsizemode = 0;
var vsmartsize_default = [3, 1];
var vsmartsize_big = [2, 1];
var vsmartsize_large = [3, 2];
var vsmartsize_huge = [5, 4];
var vsmartsizemode = 0;
function size() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			switch (sizemode) {
				case 0:
					geo.width = size_default[0];
					geo.height = size_default[1];
					sizemode = 1;
					break;
				case 1:
					geo.width = size_big[0];
					geo.height = size_big[1];
					sizemode = 2;
					break;
				case 2:
					geo.width = size_large[0];
					geo.height = size_large[1];
					sizemode = 0;
					break;
			}
			if (geo.width > wsgeo.width || geo.height > wsgeo.height) {
				geo.width = wsgeo.width;
				geo.height = wsgeo.height;
				geo.x = 0;
				geo.y = 0;
				activeClient.geometry = geo;
			}
			else {
				geo.x = (wsgeo.width - geo.width) / 2;
				geo.y = (wsgeo.height - geo.height) / 2;
				activeClient.geometry = geo;
			}
		}
	}
}
function smartsize() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			var defaultw = wsgeo.width / smartsize_default[0] * smartsize_default[1];
			var defaulth = wsgeo.height / smartsize_default[0] * smartsize_default[1];
			var bigw = wsgeo.width / smartsize_big[0] * smartsize_big[1];
			var bigh = wsgeo.height / smartsize_big[0] * smartsize_big[1];
			var largew = wsgeo.width / smartsize_large[0] * smartsize_large[1];
			var largeh = wsgeo.height / smartsize_large[0] * smartsize_large[1];
			switch (smartsizemode) {
				case 0:
					geo.width = defaultw;
					geo.height = defaulth;
					smartsizemode = 1;
					break;
				case 1:
					geo.width = bigw;
					geo.height = bigh;
					smartsizemode = 2;
					break;
				case 2:
					geo.width = largew;
					geo.height = largeh;
					smartsizemode = 0;
					break;
			}
			geo.x = (wsgeo.width - geo.width) / 2;
			geo.y = (wsgeo.height - geo.height) / 2;
			activeClient.geometry = geo;
		}
	}
}
function hsmartsize() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			var hdefaulth = wsgeo.height / hsmartsize_default[0] * hsmartsize_default[1];
			var hbigh = wsgeo.height / hsmartsize_big[0] * hsmartsize_big[1];
			var hlargeh = wsgeo.height / hsmartsize_large[0] * hsmartsize_large[1];
			var hhugeh = wsgeo.height / hsmartsize_huge[0] * hsmartsize_huge[1];
			switch (hsmartsizemode) {
				case 0:
					geo.width = wsgeo.width;
					geo.height = hdefaulth;
					hsmartsizemode = 1;
					break;
				case 1:
					geo.width = wsgeo.width;
					geo.height = hbigh;
					hsmartsizemode = 2;
					break;
				case 2:
					geo.width = wsgeo.width;
					geo.height = hlargeh;
					hsmartsizemode = 3;
					break;
				case 3:
					geo.width = wsgeo.width;
					geo.height = hhugeh;
					hsmartsizemode = 0;
					break;
			}
			geo.x = 0;
			geo.y = (wsgeo.height - geo.height) / 2;
			activeClient.geometry = geo;
		}
	}
}
function vsmartsize() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			var vdefaultw = wsgeo.width / vsmartsize_default[0] * vsmartsize_default[1];
			var vbigw = wsgeo.width / vsmartsize_big[0] * vsmartsize_big[1];
			var vlargew = wsgeo.width / vsmartsize_large[0] * vsmartsize_large[1];
			var vhugew = wsgeo.width / vsmartsize_huge[0] * vsmartsize_huge[1];
			switch (vsmartsizemode) {
				case 0:
					geo.width = vdefaultw;
					geo.height = wsgeo.height;
					vsmartsizemode = 1;
					break;
				case 1:
					geo.width = vbigw;
					geo.height = wsgeo.height;
					vsmartsizemode = 2;
					break;
				case 2:
					geo.width = vlargew;
					geo.height = wsgeo.height;
					vsmartsizemode = 3;
					break;
				case 3:
					geo.width = vhugew;
					geo.height = wsgeo.height;
					vsmartsizemode = 0;
					break;
			}
			geo.x = (wsgeo.width - geo.width) / 2;
			geo.y = 0;
			activeClient.geometry = geo;
		}
	}
}
function position(posnum) {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			switch (posnum) {
				case 1:
					geo.x = 0;
					geo.y = wsgeo.height - geo.height;
					break;
				case 4:
					geo.x = 0;
					geo.y = (wsgeo.height - geo.height) / 2;
					break;
				case 7:
					geo.x = 0;
					geo.y = 0;
					break;
				case 2:
					geo.x = (wsgeo.width - geo.width) / 2;
					geo.y = wsgeo.height - geo.height;
					break;
				case 5:
					geo.x = (wsgeo.width - geo.width) / 2;
					geo.y = (wsgeo.height - geo.height) / 2;
					break;
				case 8:
					geo.x = (wsgeo.width - geo.width) / 2;
					geo.y = 0;
					break;
				case 3:
					geo.x = wsgeo.width - geo.width;
					geo.y = wsgeo.height - geo.height;
					break;
				case 6:
					geo.x = wsgeo.width - geo.width;
					geo.y = (wsgeo.height - geo.height) / 2;
					break;
				case 9:
					geo.x = wsgeo.width - geo.width;
					geo.y = 0;
					break;
			}
			activeClient.geometry = geo;
		}
	}
}
registerShortcut("wmplus-kwin(size)", "wmplus-kwin(size)", "Meta+F3", function() { size() });
registerShortcut("wmplus-kwin(smartsize)", "wmplus-kwin(smartsize)", "Meta+F4", function() { smartsize() });
registerShortcut("wmplus-kwin(hsmartsize)", "wmplus-kwin(hsmartsize)", "Meta+F7", function() { hsmartsize() });
registerShortcut("wmplus-kwin(vsmartsize)", "wmplus-kwin(vsmartsize)", "Meta+F8", function() { vsmartsize() });
registerShortcut("wmplus-kwin(position1)", "wmplus-kwin(position1)", "Meta+1", function() { position(1) });
registerShortcut("wmplus-kwin(position4)", "wmplus-kwin(position4)", "Meta+4", function() { position(4) });
registerShortcut("wmplus-kwin(position7)", "wmplus-kwin(position7)", "Meta+7", function() { position(7) });
registerShortcut("wmplus-kwin(position2)", "wmplus-kwin(position2)", "Meta+2", function() { position(2) });
registerShortcut("wmplus-kwin(position5)", "wmplus-kwin(position5)", "Meta+5", function() { position(5) });
registerShortcut("wmplus-kwin(position8)", "wmplus-kwin(position8)", "Meta+8", function() { position(8) });
registerShortcut("wmplus-kwin(position3)", "wmplus-kwin(position3)", "Meta+3", function() { position(3) });
registerShortcut("wmplus-kwin(position6)", "wmplus-kwin(position6)", "Meta+6", function() { position(6) });
registerShortcut("wmplus-kwin(position9)", "wmplus-kwin(position9)", "Meta+9", function() { position(9) });
