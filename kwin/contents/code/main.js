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
registerShortcut("kwin-wmplus(position1)",
		"kwin-wmplus(position1)",
		"Meta+Alt+1",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = 0;
					geo.y = workGeo.height - geo.height;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position4)",
		"kwin-wmplus(position4)",
		"Meta+Alt+4",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = 0;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position7)",
		"kwin-wmplus(position7)",
		"Meta+Alt+7",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = 0;
					geo.y = 0;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position2)",
		"kwin-wmplus(position2)",
		"Meta+Alt+2",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = workGeo.height - geo.height;
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
registerShortcut("kwin-wmplus(position8)",
		"kwin-wmplus(position8)",
		"Meta+Alt+8",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = (workGeo.width - geo.width) / 2;
					geo.y = 0;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position3)",
		"kwin-wmplus(position3)",
		"Meta+Alt+3",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = workGeo.width - geo.width;
					geo.y = workGeo.height - geo.height;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position6)",
		"kwin-wmplus(position6)",
		"Meta+Alt+6",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = workGeo.width - geo.width;
					geo.y = (workGeo.height - geo.height) / 2;
					activeClient.geometry = geo;
				}
			}
		});
registerShortcut("kwin-wmplus(position9)",
		"kwin-wmplus(position9)",
		"Meta+Alt+9",
		function() {
			var clients = workspace.clientList();
			for (var i=0; i<clients.length; i++) {
				if(clients[i].active) {
					activeClient = clients[i];
					var workGeo = workspace.clientArea(KWin.PlacementArea, activeClient.screen, 1);
					var geo = activeClient.geometry;
					geo.x = workGeo.width - geo.width;
					geo.y = 0;
					activeClient.geometry = geo;
				}
			}
		});
