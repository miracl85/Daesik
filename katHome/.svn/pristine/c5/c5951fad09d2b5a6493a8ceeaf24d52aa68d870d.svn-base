	
	function MobileCreateTable(data) {
	
		var listSize = data.rows.length;
		var contents = "";
		for(var index = 0; index < listSize; index++){
			
			var browser = data.rows[index][2];
			var browserVersion = data.rows[index][3];
			var mobileDevice = "";
			var mobileDeviceInfo = data.rows[index][1];
			var mobileDeviceMarketingName = data.rows[index][0];
			var browserSize = data.rows[index][4];
			var users = parseInt(data.rows[index][5]);
			
			if(browser == "(not set)" || browserVersion == "(not set)" || browserSize == "(not set)") {
			} else {
				if(mobileDeviceMarketingName == "(not set)" && mobileDeviceInfo == "(not set)") {
					
				} else if(mobileDeviceMarketingName == "(not set)"){
					mobileDevice = mobileDeviceInfo;
					contents += createContents(mobileDevice,browser,browserVersion,browserSize,users);
				} else if(mobileDeviceInfo == "(not set)") {
					mobileDevice = mobileDeviceMarketingName;
					contents += createContents(mobileDevice,browser,browserVersion,browserSize,users);
				} else {
					mobileDevice = mobileDeviceMarketingName;
					contents += createContents(mobileDevice,browser,browserVersion,browserSize,users);
				}
			}			
		}
		
		$("#mobile_contents").html(contents);
		
	}
	
	function createContents(mobileDevice,browser,browserVersion,browserSize,users) {
		var contents = "";
		contents =	"<tr>" +
						"<td>"+mobileDevice+"</td>" +
						"<td>"+browser+"</td>" +
						"<td>"+browserVersion+"</td>" +
						"<td>"+browserSize+"</td>" +
						"<td>"+users+"</td>" +
					"</tr>";
		return contents;
	}