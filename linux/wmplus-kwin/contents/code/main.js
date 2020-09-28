var size0_default = [800 , 600];
var size0_big = [1024 , 768];
var size0_large = [1280 , 960];
var size0_mode = 0;
var size1_default = [720 , 405];
var size1_big = [1280 , 720];
var size1_large = [1440 , 810];
var size1_mode = 0;
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

function size0() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			switch (size0_mode) {
				case 0:
					geo.width = size0_default[0];
					geo.height = size0_default[1];
					size0_mode = 1;
					break;
				case 1:
					geo.width = size0_big[0];
					geo.height = size0_big[1];
					size0_mode = 2;
					break;
				case 2:
					geo.width = size0_large[0];
					geo.height = size0_large[1];
					size0_mode = 0;
					break;
			}
			geo.x = (wsgeo.width - geo.width) / 2;
			geo.y = (wsgeo.height - geo.height) / 2;
			activeClient.geometry = geo;
		}
	}
}

function size1() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			switch (size1_mode) {
				case 0:
					geo.width = size1_default[0];
					geo.height = size1_default[1];
					size1_mode = 1;
					break;
				case 1:
					geo.width = size1_big[0];
					geo.height = size1_big[1];
					size1_mode = 2;
					break;
				case 2:
					geo.width = size1_large[0];
					geo.height = size1_large[1];
					size1_mode = 0;
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

registerShortcut("wmplus-kwin(size0)", "wmplus-kwin(size0)", "Meta+F3", function() { size0() });
registerShortcut("wmplus-kwin(size1)", "wmplus-kwin(size1)", "Meta+F4", function() { size1() });
registerShortcut("wmplus-kwin(smartsize)", "wmplus-kwin(smartsize)", "Meta+F2", function() { smartsize() });
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
