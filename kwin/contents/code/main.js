var size_default = [800, 600];
var size_big = [1024, 768];
var size_large = [1280, 960];
var smartsize_big = [3, 2];
var smartsize_large = [5, 4];
function size() {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			if (geo.width == size_default[0] && geo.height == size_default[1]) {
				geo.width = size_big[0];
				geo.height = size_big[1];
			}
			else if (geo.width == size_big[0] && geo.height == size_big[1]) {
				geo.width = size_large[0];
				geo.height = size_large[1];
			}
			else if (geo.width == size_large[0] && geo.height == size_large[1]) {
				geo.width = size_default[0];
				geo.height = size_default[1];
			}
			else {
				geo.width = size_default[0];
				geo.height = size_default[1];
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
			var bigw = wsgeo.width / smartsize_big[0] * smartsize_big[1];
			var bigh = wsgeo.height / smartsize_big[0] * smartsize_big[1];
			var largew = wsgeo.width / smartsize_large[0] * smartsize_large[1];
			var largeh = wsgeo.height / smartsize_large[0] * smartsize_large[1];
			if (geo.width == bigw && geo.height == bigh) {
				geo.width = largew;
				geo.height = largeh;
			}
			else if (geo.width == largew && geo.height == largeh) {
				geo.width = bigw;
				geo.height = bigh;
			}
			else {
				geo.width = bigw;
				geo.height = bigh;
			}
			geo.x = (wsgeo.width - geo.width) / 2;
			geo.y = (wsgeo.height - geo.height) / 2;
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
			switch (posnum){
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
registerShortcut("kwin-wmplus(size)", "kwin-wmplus(size)", "Meta+Ctrl+1", function() { size() });
registerShortcut("kwin-wmplus(smartsize)", "kwin-wmplus(smartsize)", "Meta+Ctrl+2", function() { smartsize() });
registerShortcut("kwin-wmplus(position1)", "kwin-wmplus(position1)", "Meta+Alt+1", function() { position(1) });
registerShortcut("kwin-wmplus(position4)", "kwin-wmplus(position4)", "Meta+Alt+4", function() { position(4) });
registerShortcut("kwin-wmplus(position7)", "kwin-wmplus(position7)", "Meta+Alt+7", function() { position(7) });
registerShortcut("kwin-wmplus(position2)", "kwin-wmplus(position2)", "Meta+Alt+2", function() { position(2) });
registerShortcut("kwin-wmplus(position5)", "kwin-wmplus(position5)", "Meta+Alt+5", function() { position(5) });
registerShortcut("kwin-wmplus(position8)", "kwin-wmplus(position8)", "Meta+Alt+8", function() { position(8) });
registerShortcut("kwin-wmplus(position3)", "kwin-wmplus(position3)", "Meta+Alt+3", function() { position(3) });
registerShortcut("kwin-wmplus(position6)", "kwin-wmplus(position6)", "Meta+Alt+6", function() { position(6) });
registerShortcut("kwin-wmplus(position9)", "kwin-wmplus(position9)", "Meta+Alt+9", function() { position(9) });
