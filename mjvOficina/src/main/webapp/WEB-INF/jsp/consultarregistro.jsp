<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MJV Oficina</title>
	<!-- Material Design -->
	<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<!-- Fontes -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@400;700&family=Catamaran:wght@400;700&display=swap" rel="stylesheet">
	<style type="text/css">
		*{
			padding: 0;
			margin: 0;
			box-sizing: border-box;
			text-transform: none !important;
			outline: none;
		}
		
		label{
			font-family: 'Catamaran', sans-serif !important;
		}
		
		a{
			text-decoration: none !important;
		}
		
		p{
			font-size: 14px !important;
			font-family: 'Catamaran', sans-serif !important;
			font-weight: 400;
			color: #808080
		}
		
		span{
			font-family: 'Catamaran', sans-serif !important;
			font-weight: 700;
			font-size: 18px;
		}
		
		h3{
			font-family: 'Baloo 2', cursive !important;
			color: #282828;
			font-weight: 700;
		}
		
		th{
			font-family: 'Catamaran', sans-serif !important !important;
			font-weight: 700 !important;
			font-size: 18px !important;
			text-transform: uppercase !important;
		}
		
		.registroColumn{
			font-family: 'Catamaran', sans-serif !important;
			font-size: 14px;
			vertical-align: middle;
			line-height: 2rem;
		}
		
		.modal.modal-static .modal-dialog {
		 -webkit-transform: none !important; transform: none !important;
		}
		
		.mdc-menu-surface--open{
			max-height: 200px !important
		}
		
		.btn:focus{
			box-shadow: none !important;
		}
	</style>
</head>
<body>
	<!-- Modal -->
	<div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg modal-dialog-centered">
	    <div class="modal-content">    
	      <div class="modal-header row px-5 border-0">
	      		<h3 class="my-4 col-12 w-100">Registros de defeitos veiculares</h3>
	      		<div class="col-12 mb-3">
		        	<label for="veiculos">Tipo de veículo:</label> 
					<select id="nameVeiculo" class="form-control" style="height: 50px; width: 60%">
						<option value="" hidden>Selecione o veículo</option>
						<option value="" >Todos</option>
							<c:forEach items="${veiculosList}" var="veiculo">
								  <option value="${ veiculo.nome }">${ veiculo.nome }</option>
							 </c:forEach>
					</select>
		        </div>
	      		<div class="col-5 my-3">
		        	<label class="mdc-text-field data-incio mdc-text-field--outlined mdc-text-field--with-leading-icon w-100">
						  <span class="mdc-notched-outline">
						   <span class="mdc-notched-outline__leading"></span>
						    <span class="mdc-notched-outline__notch">
						      <span class="mdc-floating-label" id="my-label-id">Data ínicio</span>
						    </span>
						    <span class="mdc-notched-outline__trailing"></span>
						  </span>
						  <i class="material-icons mdc-text-field__icon mdc-text-field__icon--leading tabindex="0" role="button">calendar_today</i>
						  <input id="dataInicio" class="mdc-text-field__input" type="date" aria-labelledby="my-label-id">

					</label>
	        	</div>
	        	<div class="col-5 my-3">
		        	<label class="mdc-text-field data-fim mdc-text-field--outlined mdc-text-field--with-leading-icon w-100">
						  <span class="mdc-notched-outline">
						   <span class="mdc-notched-outline__leading"></span>
						    <span class="mdc-notched-outline__notch">
						      <span class="mdc-floating-label" id="my-label-id">Data fim</span>
						    </span>
						    <span class="mdc-notched-outline__trailing"></span>
						  </span>
						  <i class="material-icons mdc-text-field__icon mdc-text-field__icon--leading tabindex="0" role="button">calendar_today</i>
						  <input id="dataFim" class="mdc-text-field__input" type="date" aria-labelledby="my-label-id">
					</label>
	        	</div>
	      	</div>
			<div class="modal-body px-5">
				<div class="row pb-4 px-3">
					<div class="mdc-data-table w-100" style="background: #F0F0F0">
					  <div class="w-100">
					  	<div class="row">
					  		<div class="col-1"></div>
					  		<div class="col-3 py-3" style="font-family: 'Catamaran', sans-serif !important;font-weight: 700;font-size: 18px;">
					  			CLIENTE
					  		</div>
					  		<div class="col-2 py-3" style="font-family: 'Catamaran', sans-serif !important;font-weight: 700;font-size: 18px;">
					  			DATA
					  		</div>
					  		<div class="col-3 py-3" style="font-family: 'Catamaran', sans-serif !important;font-weight: 700;font-size: 18px;">
					  			VEÍCULO
					  		</div>
					  		<div class="col-3 py-3">
					  			
					  		</div>
					  	</div>
					    <div class="accordion" id="accordionExample">
					    <c:forEach items="${registrosList}" var="registro">
						  <div class="card">
						    <div class="card-header p-0" id="heading${ registro.idRegistro }">
						        <div class="row">
							  		<div class="col-1"></div>
							  		<div class="col-3 py-3 registroColumn">
							  			${ registro.nomeCliente }
							  		</div>
							  		<div class="col-2 py-3 registroColumn">
							  			${ registro.data.toString().substring(8,10) }/${ registro.data.toString().substring(5,7) }/${ registro.data.toString().substring(0,4) }
							  		</div>
							  		<div class="col-3 py-3 registroColumn">
							  			${ registro.nomeVeiculo }
							  		</div>
							  		<div class="col-3 py-3">
							  			<button onclick="ajaxDetalhes(this)" id="${ registro.idRegistro }" type="button" style="text-decoration: underline !important; color:#FF7800; border:none; font-family: 'Catamaran', sans-serif !important;font-size: 14px" class="btn btn-link btn-block text-left" data-toggle="collapse" data-target="#collapse${ registro.idRegistro }" aria-expanded="true" aria-controls="collapse${ registro.idRegistro }">
								          Ver detalhes
								        </button>
							  		</div>
							  	</div>  
						    </div>
						    <div id="collapse${ registro.idRegistro }" class="collapse" aria-labelledby="heading${ registro.idRegistro }" data-parent="#accordionExample">
						      <div class="card-body">
						        <ul class="list-group list${ registro.idRegistro }">
						        	<li class="list-group-item listDefeitoPeca">Defeito Peca</li>
								</ul>
						      </div>
						    </div>
						  </div>
						  </c:forEach>
						</div>
					  </div>
				</div>
	        </div>
	      </div>
	      <div class="modal-footer border-0 row pb-4 pr-5 pl-0">
	        	<a class="col-6" href="/">
	        	<button class="mdc-button" style="color:#702094">
				<div class="mdc-button__ripple"></div>
					  <i class="material-icons mdc-button__icon" aria-hidden="true"
					    >arrow_back</i
					  >
				<span class="mdc-button__label">Voltar ao menu</span>
				</button></a>
				<button onclick="pesquisar()" class=" col-5 mdc-button px-3 w-100 mdc-button--raised" style="background:#702094; border-radius: 20px">
		  			<span class="mdc-button__label">Pesquisar</span>
				</button>
	       </div>
	    </div>
	  </div>
	</div>
	<script>
		$( document ).ready(function(){
			$('#staticBackdrop').modal("show");
			mdc.ripple.MDCRipple.attachTo(document.querySelector('.mdc-button'));
			mdc.textField.MDCTextField.attachTo(document.querySelector('.data-incio'));
			mdc.textField.MDCTextField.attachTo(document.querySelector('.data-fim'));
		})
		
		function ajaxDetalhes(button) {
			console.log($(".list" + button.id))
			
			$.ajax({
				method: "GET",
				url: '/registro/getpecadefeito',
				contentType: 'application/json',
				data: {id: button.id},
				success: function(response) {
					$(".list" + button.id).html("");
					
					response.forEach((element) => {
						$(".list" + button.id).append(
							'<li class="list-group-item listDefeitoPeca ml-4 pl-3">' + element.nomePeca + ' - ' + element.nomeDefeito + '</li>'
						);
					});	
			    },
			    error: function (jqXhr, textStatus, errorMessage) {
			    }
			})
		}

		function pesquisar() {
			console.log($("#nameVeiculo option:selected").val())
			console.log($("#dataInicio").val())
			console.log($("#dataFim").val())
			
			$.ajax({
				method: "GET",
				url: '/registro/consultar',
				contentType: 'application/json',
				data: {nameVeiculo: $("#nameVeiculo option:selected").val(), dataInicio: $("#dataInicio").val(), dataFim: $("#dataFim").val()},
				success: function(response) {
					$("#accordionExample").html("");
					response.forEach((registro) => {
						
						$("#accordionExample").append(
								'<div class="card">' + 
							    '<div class="card-header p-0" id="heading' + registro.idRegistro + '">' +
							       '<div class="row">' +
								  		'<div class="col-1"></div>' +
								  		'<div class="col-3 py-3 registroColumn">'+ registro.nomeCliente +
								  		'</div>' +
								  		'<div class="col-2 py-3 registroColumn">' + registro.data +
								  		'</div>' +
								  		'<div class="col-3 py-3 registroColumn">' + registro.nomeVeiculo +
								  		'</div>' +
								  		'<div class="col-3 py-3">' +
								  			'<button onclick="ajaxDetalhes(this)" id="' + registro.idRegistro +  '" type="button" style="text-decoration: underline !important; color:#FF7800; border:none; line-height: 1.3rem" class="btn btn-link btn-block text-left registroColumn" data-toggle="collapse" data-target="#collapse' + registro.idRegistro + '" aria-expanded="true" aria-controls="collapse' + registro.idRegistro + '">' +
									          'Ver detalhes'+
									        '</button>' +
								  		'</div>' +
								  	'</div>' + 
								'</div>' +
							    '<div id="collapse' + registro.idRegistro + '" class="collapse" aria-labelledby="heading' + registro.idRegistro + '" data-parent="#accordionExample">' +
							      '<div class="card-body">' +
							        '<ul class="list-group list' + registro.idRegistro + '">' +
							        	
									'</ul>'+
								  '</div>' + 
								 '</div>' + 
								'</div>'
						);
					});
			    },
			    error: function (jqXhr, textStatus, errorMessage) {
			    }
			})
		}
	</script>
</body>
</html>