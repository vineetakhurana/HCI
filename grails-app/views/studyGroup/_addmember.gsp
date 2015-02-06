<script type="text/javascript">
var i=0;

function remove(name,option)
{
	   
	   var res=name.split("%");
	   var splitResult=res[1];
	   var elem="someInputId%"+splitResult;
	   var inputelem=document.getElementById(elem);
	  	var p = document.getElementById("inputPlaceHolder");
	  	//var div=document.getElementById("divider");
	  	var n=document.getElementById(name);
	  	 //p.removeChild(inputElem);		
	  	//p.removeChid(n);	   
	  	if(inputelem) 
		  	inputelem.parentNode.removeChild(inputelem);	
		  	var x=document.getElementById(option);
		  //x['enabled']="true";
		  		  	
	  	if(n) n.parentNode.removeChild(n);	
	  	if(x) n.parentNode.removeChild(x);
	}

function x(){

	var n=document.getElementById("mySelect");
	
	 var selectedOption = n.selectedIndex;
	 n.options[selectedOption].disabled = true;
	  for (var k=0; k<=0; k++) {
	// loop to create the number of inputs based apon `n`(selected value) 
	     	       
	       var inpt = document.createElement("input");
	       var bttn = document.createElement("input");
	       inpt['type'] = "text"; // the input type is text
	       var a=i+'';
	       inpt['id'] = "someInputId%" + a + '';  // set a id for optional reference 
	       inpt['name'] = "tagN";  // an unique name for each of the inputs
	       inpt['value'] = n.value;			//tag displayed
	       //input['readonly'] = "true"; //new

	      
	       //bttn.style.color="red";
	        bttn['type']="button" ;
			bttn['id']="Remove%" + a;
	        bttn['name']="Remove%" + a;
	        bttn['value']="X"
	        //bttn['readonly'] = "true"; //new
	       var n= "someInputId%"+ a; 
	       var name="Remove%" + a;
	       //bttn['value']="Remove"
	       //bttn.style.background=url(/images/netapplogo.png)";
	        
		   bttn['onclick']=function(){remove(name,n)};
		   //alert("Remove%" + i);
		   
		   var idname="someInputId%" + a
		   var idbname="Remove%" + a
		   var p = document.getElementById("inputPlaceHolder");
	      //odiv.appendChild(inpt); // append the each input to a div
	       //odiv.appendChild(bttn);
	        p.appendChild(inpt); // append the div and inputs to the placeholder (inputPlaceHolder)
	     	p.appendChild(bttn);
	     	
	     	document.getElementById(idname).readOnly = true;
	     	
	     	
			}
			i=i+1;
	   }

</script>
  		<div class="tags">
	<g:select name="courseName"
								style="
    width: 163px;
    height: 26px;font-size:16px;
" from="${memberlist}"
								id="mySelect" required="true" value="select" onchange="x()" onkeyup="x()" />
								<br>
								<br>
	</div>

<div id="inputPlaceHolder">
</div>