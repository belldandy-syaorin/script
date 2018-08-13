var size_default0 = [800 , 600];
var size_big0 = [1024 , 768];
var size_large0 = [1280 , 960];
var size_default1 = [800 , 450];
var size_big1 = [1024 , 576];
var size_large1 = [1280 , 720];
var size_mode = 0;
var smartsize_default = [2 , 1];
var smartsize_big = [3 , 2];
var smartsize_large = [5 , 4];
var smartsize_mode = 0;
var hsmartsize_default = [2 , 1];
var hsmartsize_big = [3 , 2];
var hsmartsize_large = [5 , 4];
var hsmartsize_mode = 0;
var vsmartsize_default = [2 , 1];
var vsmartsize_big = [3 , 2];
var vsmartsize_large = [5 , 4];
var vsmartsize_mode = 0;

function size() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			switch (size_mode) {
				case 0:
					geo.width = size_default0[0];
					geo.height = size_default0[1];
					size_mode = 1;
					break;
				case 1:
					geo.width = size_big0[0];
					geo.height = size_big0[1];
					size_mode = 2;
					break;
				case 2:
					geo.width = size_large0[0];
					geo.height = size_large0[1];
					size_mode = 3;
					break;
				case 3:
					geo.width = size_default1[0];
					geo.height = size_default1[1];
					size_mode = 4;
					break;
				case 4:
					geo.width = size_big1[0];
					geo.height = size_big1[1];
					size_mode = 5;
					break;
				case 5:
					geo.width = size_large1[0];
					geo.height = size_large1[1];
					size_mode = 0;
					break;
			}
			geo.x = (wsgeo.width - geo.width) / 2;
			geo.y = (wsgeo.height - geo.height) / 2;
			activeClient.geometry = geo;
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
			var smartsize_defaultw = wsgeo.width / smartsize_default[0] * smartsize_default[1];
			var smartsize_defaulth = wsgeo.height / smartsize_default[0] * smartsize_default[1];
			var smartsize_bigw = wsgeo.width / smartsize_big[0] * smartsize_big[1];
			var smartsize_bigh = wsgeo.height / smartsize_big[0] * smartsize_big[1];
			var smartsize_largew = wsgeo.width / smartsize_large[0] * smartsize_large[1];
			var smartsize_largeh = wsgeo.height / smartsize_large[0] * smartsize_large[1];
			switch (smartsize_mode) {
				case 0:
					geo.width = smartsize_defaultw;
					geo.height = smartsize_defaulth;
					smartsize_mode = 1;
					break;
				case 1:
					geo.width = smartsize_bigw;
					geo.height = smartsize_bigh;
					smartsize_mode = 2;
					break;
				case 2:
					geo.width = smartsize_largew;
					geo.height = smartsize_largeh;
					smartsize_mode = 0;
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
			var hsmartsize_defaulth = wsgeo.height / hsmartsize_default[0] * hsmartsize_default[1];
			var hsmartsize_bigh = wsgeo.height / hsmartsize_big[0] * hsmartsize_big[1];
			var hsmartsize_largeh = wsgeo.height / hsmartsize_large[0] * hsmartsize_large[1];
			switch (hsmartsize_mode) {
				case 0:
					geo.width = wsgeo.width;
					geo.height = hsmartsize_defaulth;
					hsmartsize_mode = 1;
					break;
				case 1:
					geo.width = wsgeo.width;
					geo.height = hsmartsize_bigh;
					hsmartsize_mode = 2;
					break;
				case 2:
					geo.width = wsgeo.width;
					geo.height = hsmartsize_largeh;
					hsmartsize_mode = 0;
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
			var vsmartsize_defaultw = wsgeo.width / vsmartsize_default[0] * vsmartsize_default[1];
			var vsmartsize_bigw = wsgeo.width / vsmartsize_big[0] * vsmartsize_big[1];
			var vsmartsize_largew = wsgeo.width / vsmartsize_large[0] * vsmartsize_large[1];
			switch (vsmartsize_mode) {
				case 0:
					geo.width = vsmartsize_defaultw;
					geo.height = wsgeo.height;
					vsmartsize_mode = 1;
					break;
				case 1:
					geo.width = vsmartsize_bigw;
					geo.height = wsgeo.height;
					vsmartsize_mode = 2;
					break;
				case 2:
					geo.width = vsmartsize_largew;
					geo.height = wsgeo.height;
					vsmartsize_mode = 0;
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
