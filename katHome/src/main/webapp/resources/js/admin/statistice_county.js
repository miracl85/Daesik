	function countryCreateTable(data) {
	
		var listSize = data.rows.length;
		var contents = "";
		
		for(var index = 0; index < listSize; index++){
			var country = data.rows[index][0];
			var users = parseInt(data.rows[index][1]);
			
			if(country == "(not set)") {
				contents +=	"<tr>" +
								"<td>unknown</td>" +
								"<td>"+users+"</td>" +
							"</tr>";	
			} else {
				contents +=	"<tr>" +
								"<td>"+country+"</td>" +
								"<td>"+users+"</td>" +
							"</tr>";	
			}
		}
		$("#county_contents").html(contents);		
	}