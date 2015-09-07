function size(a,b) {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			geo.width = a;
			geo.height = b;
			if (wsgeo.width > geo.width && wsgeo.height > geo.height) {
				geo.x = (wsgeo.width - geo.width) / 2;
				geo.y = (wsgeo.height - geo.height) / 2;
				activeClient.geometry = geo;
			}
			else {
				clients[i].minimized = true;
			}
		}
	}
}
function smartsize(a,b) {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			geo.width = wsgeo.width / a * b;
			geo.height = wsgeo.height / a * b;
			geo.x = (wsgeo.width - geo.width) / 2;
			geo.y = (wsgeo.height - geo.height) / 2;
			activeClient.geometry = geo;
		}
	}
}
function position(a) {
	var clients = workspace.clientList();
	for (var i=0; i<clients.length; i++) {
		if(clients[i].active) {
			activeClient = clients[i];
			var wsgeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
			var geo = activeClient.geometry;
			switch (a){
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
registerShortcut("kwin-wmplus(size_default)", "kwin-wmplus(size_default)", "Meta+Ctrl+1", function() { size(800,600) });
registerShortcut("kwin-wmplus(size_big)", "kwin-wmplus(size_big)", "Meta+Ctrl+2", function() { size(1024,768) });
registerShortcut("kwin-wmplus(size_large)", "kwin-wmplus(size_large)", "Meta+Ctrl+3", function() { size(1280,960) });
registerShortcut("kwin-wmplus(smartsize_big)", "kwin-wmplus(smartsize_big)", "Meta+Ctrl+4", function() { smartsize(3,2) });
registerShortcut("kwin-wmplus(smartsize_large)", "kwin-wmplus(smartsize_large)", "Meta+Ctrl+5", function() { smartsize(5,4) });
registerShortcut("kwin-wmplus(position1)", "kwin-wmplus(position1)", "Meta+Alt+1", function() { position(1) });
registerShortcut("kwin-wmplus(position4)", "kwin-wmplus(position4)", "Meta+Alt+4", function() { position(4) });
registerShortcut("kwin-wmplus(position7)", "kwin-wmplus(position7)", "Meta+Alt+7", function() { position(7) });
registerShortcut("kwin-wmplus(position2)", "kwin-wmplus(position2)", "Meta+Alt+2", function() { position(2) });
registerShortcut("kwin-wmplus(position5)", "kwin-wmplus(position5)", "Meta+Alt+5", function() { position(5) });
registerShortcut("kwin-wmplus(position8)", "kwin-wmplus(position8)", "Meta+Alt+8", function() { position(8) });
registerShortcut("kwin-wmplus(position3)", "kwin-wmplus(position3)", "Meta+Alt+3", function() { position(3) });
registerShortcut("kwin-wmplus(position6)", "kwin-wmplus(position6)", "Meta+Alt+6", function() { position(6) });
registerShortcut("kwin-wmplus(position9)", "kwin-wmplus(position9)", "Meta+Alt+9", function() { position(9) });
