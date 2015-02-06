
<script type="text/javascript">
 var i=0;

 	function remove(name,n)
 	{
 		
 		  var inputelem=document.getElementById(n);
 		  var p = document.getElementById("something");
 		  	//var div=document.getElementById("divider");
 		  var name_file=document.getElementById(name);
 		  	 //p.removeChild(inputElem);		
 		  	//p.removeChid(n);	   
 		  	if(inputelem) 
 			  	inputelem.parentNode.removeChild(inputelem);	
 			  	var x=document.getElementById(n);
 			  	//x['enabled']="true";
 			if(name_file) name_file.parentNode.removeChild(name_file);	
 	}
	function attach()
	{
		
		var inpt = document.createElement("input");
	    inpt['type'] = "text"; // the input type is text
	    inpt['name'] = "attach";  // an unique name for each of the inputs
	    inpt['id']="someInputId%" + i;
	    var bttn = document.createElement("input");
	  	bttn['type']= "button";
		bttn['value']="Click to Add More Members"; 
		bttn['onclick']=function(){attach_more()};   

		var removebttn= document.createElement("input");
		removebttn['type']="button";
		removebttn['id']="Remove%" + i;
		removebttn['name']="Remove%" + i;
		removebttn['value']="X"
		var name="someInputId%" + i;
		var n="Remove%" + i;
		removebttn['onclick']=function(){remove(name,n)};
		 
	    var place=document.getElementById("something");
	    var more=document.getElementById("more");
	    var first=document.getElementById("first_time");
	    first.parentNode.removeChild(first);	

		place.appendChild(inpt);
		place.appendChild(removebttn);
		more.appendChild(bttn);

		i=i+1;
	}

	function attach_more()
	{
		 var inpt = document.createElement("input");
	     inpt['type'] = "text"; // the input type is text
	     inpt['name'] = "attach";  // an unique name for each of the inputs
	     inpt['id']="someInputId%" + i;
	     var removebttn= document.createElement("input");
		 removebttn['type']="button";
		 removebttn['id']="Remove%" + i;
		 removebttn['name']="Remove%" + i;
		 removebttn['value']="X"
		 var name="someInputId%" + i;
		 var n="Remove%" + i;
		 removebttn['onclick']=function(){remove(name,n)};
	    
	     var place=document.getElementById("something");
		 place.appendChild(inpt);
		 place.appendChild(removebttn);

		 i=i+1;
				
	}
	
</script>
<div id="something" class="placeholder" ></div>

<div id="more" style="width: 162px;"></div>

<div id="first_time"><br>
	<input type="button" name="Upload" class="as"
		value="Click to Add More Members" 
		id="Upload" onClick="attach()" style="width: 162px; height: 26px;"/> <br>
</div>

