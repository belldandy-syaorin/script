registerShortcut("kwin-wmplus(size_default)",
		"kwin-wmplus(size_default)",
		"Meta+Ctrl+1",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.width = 800;
					geo.height = 600;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(size_big)",
		"kwin-wmplus(size_big)",
		"Meta+Ctrl+2",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.width = 1024;
					geo.height = 768;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(size_large)",
		"kwin-wmplus(size_large)",
		"Meta+Ctrl+3",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.width = 1280;
					geo.height = 960;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(smartsize_big)",
		"kwin-wmplus(smartsize_big)",
		"Meta+Ctrl+4",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.width = workGeo.width / 3 * 2;
					geo.height = workGeo.height / 3 * 2;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(smartsize_large)",
		"kwin-wmplus(smartsize_large)",
		"Meta+Ctrl+5",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.width = workGeo.width / 5 * 4;
					geo.height = workGeo.height / 5 * 4;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position5)",
		"kwin-wmplus(position5)",
		"Meta+Alt+5",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
