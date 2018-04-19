	
	function diviceCreateTable(data) {
	
		var listSize = data.rows.length;
		var contents = "";
		for(var index = 0; index < listSize; index++){
			var deviceCategory = data.rows[index][0];
			var users = parseInt(data.rows[index][1]);
			
			contents +=	"<tr>" +
							"<td>"+deviceCategory+"</td>" +
							"<td>"+users+"</td>" +
						"</tr>";
		}
		$("#divice_contents").html(contents);
	}