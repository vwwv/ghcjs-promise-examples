

function startBestEverUI(compute){
  
  alert( ' Computing the meaning of the live,'
  	   + ' please take a sit,'
  	   + ' this gonna take a while'
  	   );

  compute.then(
    function(meaning){
      alert("The meaning of the live is: "+meaning);
    }
  );
}


