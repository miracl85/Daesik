	function OSCreateTable(data) {
	
		var listSize = data.rows.length;
	
		var contents = "";
		for(var index = 0; index < listSize; index++){
			
			var browser = data.rows[index][0];
			var browserVersion = data.rows[index][1];
			var operatingSystem = data.rows[index][2];
			var operatingSystemVersion = data.rows[index][3];
			var users = parseInt(data.rows[index][4]);
			if(browser == "(not set)" || browserVersion == "(not set)" 
				|| operatingSystem == "(not set)" || operatingSystemVersion == "(not set)") {
			} else {
				contents +=	"<tr>" +
								"<td>"+browser+"</td>" +
								"<td>"+browserVersion+"</td>" +
								"<td>"+operatingSystem+"</td>" +
								"<td>"+operatingSystemVersion+"</td>" +
								"<td>"+users+"</td>" +
							"</tr>";
			}
		}
		
		$("#os_contents").html(contents);
		
	}
	