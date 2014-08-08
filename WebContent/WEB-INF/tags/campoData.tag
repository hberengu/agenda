<%@ attribute name="id" required="true" %>
<%@ attribute name="valor" required="false" %>

<input id="${id}" name="${id}" value="${valor}" />

<!-- 
<script>
	$("#${id}").datepicker({dateFormat: 'dd/mm/yy'});
</script>
-->
<script type="text/javascript">  
    $("#${id}").datepicker({  
        dateFormat : 'dd/mm/yy',  
        changeMonth : true,  
        changeYear : true,  
        autoSize : true,  
        monthNamesShort: ["Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"],  
        dayNamesMin: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"]  
    });  
</script>  