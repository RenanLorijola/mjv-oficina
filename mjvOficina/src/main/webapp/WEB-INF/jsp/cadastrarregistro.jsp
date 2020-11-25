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
		
		.modal.modal-static .modal-dialog {
		 -webkit-transform: none !important; transform: none !important;
		}
		
		.mdc-menu-surface--open{
			max-height: 200px !important
		}
	</style>
</head>
<body>
	<!-- Modal -->
	<div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg modal-dialog-centered">
	    <div class="modal-content">
	    	<form method="post" action="/registro/cadastrar">
		      <div class="modal-header row px-5 border-0">
		      		<h3 class="my-4 col-12 w-100">Registros de defeitos veiculares</h3>
		      		<div class="col-6 my-3">
			        	<label class="mdc-text-field mdc-text-field--outlined w-100">
							  <span class="mdc-notched-outline">
							   <span class="mdc-notched-outline__leading"></span>
							    <span class="mdc-notched-outline__notch">
							      <span class="mdc-floating-label" id="my-label-id">Nome do cliente</span>
							    </span>
							    <span class="mdc-notched-outline__trailing"></span>
							  </span>
							  <input name="nomeCliente" id="inputName" class="mdc-text-field__input" type="text" aria-labelledby="my-label-id">
							  <i id="verificado" style="display: none" class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="0" role="button">check</i>
						</label>
		        	</div>
		        	<div class="col-3 my-4">
		        		<p id="data" class="mb-1"></p>
		        		<p id="hora"></p>
		        	</div>
		        	<div class="col-6 mb-3">
						<div class="form-group ml-2 w-100">
							    <label for="veiculos">Tipo de veículo:</label> 
							    <select name="name" class="form-control" id="veiculos" style="height: 50px; width: 60%">
							      <option value="">Selecione o veículo</option>
							      <c:forEach items="${veiculosList}" var="veiculo">
								      <option value="${ veiculo.nome }">${ veiculo.nome }</option>
							      </c:forEach>
							    </select>
							</div> 
			        	</div>
		      	</div>
				<div class="modal-body px-5">
					<div class="row pb-4 px-3">
						<table class="table table-hover table-borderless ml-auto mr-auto mt-4 table-wrapper-scroll-y my-custom-scrollbar" style="width: 80%; background-color: #F0F0F0">
						<thead>
					    	<tr>
						    	<th class="pr-2">ITENS</th>
					        	<th style="padding-right: 70px;">DEFEITO</th>
					        	<th>PEÇA</th>
					    	</tr>
					  	</thead>
					  	<tbody id="tabela">
						   
						</tbody>
					</table>
		        </div>
		      </div>
		      <div class="modal-footer border-0 row pb-4 pr-5 pl-0">
		        	<a class="col-6" href="/">
		        	<button type="button" class="mdc-button" style="color:#702094">
					<div class="mdc-button__ripple"></div>
						  <i class="material-icons mdc-button__icon" aria-hidden="true"
						    >arrow_back</i
						  >
					<span class="mdc-button__label">Voltar ao menu</span>
					</button></a>
					<button disabled id="salvar" type="submit" class="mdc-button col-5 px-3 mdc-button--raised" style="background:#BFBFBF; border-radius: 20px">
			  			<span class="mdc-button__label">Salvar</span>
					</button>
		       </div>
	       </form>
	    </div>
	  </div>
	</div>
	<script>
		$( document ).ready(function() {
			const now = new Date();

			// Formata a data conforme dd/mm/aaaa e hh:ii:ss
			const data = "Acesso: " + zeroFill(now.getUTCDate()) + '/' + zeroFill((now.getMonth() + 1)) + '/' + now.getFullYear();
			const hora = "Horário: " +  zeroFill(now.getHours()) + ':' + zeroFill(now.getMinutes()) + ':' + zeroFill(now.getSeconds());
			// Exibe na tela usando as divs data e hora
			document.getElementById('data').innerHTML = data;
			document.getElementById('hora').innerHTML = hora;
			
			$('#staticBackdrop').modal("show");
			mdc.ripple.MDCRipple.attachTo(document.querySelector('.mdc-button'));
			mdc.textField.MDCTextField.attachTo(document.querySelector('.mdc-text-field'));
		})

		const zeroFill = n => {
				return ('0' + n).slice(-2);
		}

		// Cria intervalo
		const interval = setInterval(() => {
		// Pega o horário atual
		const now = new Date();

		// Formata a data conforme dd/mm/aaaa e hh:ii:ss
		const data = "Acesso: " + zeroFill(now.getUTCDate()) + '/' + zeroFill((now.getMonth() + 1)) + '/' + now.getFullYear();
		const hora = "Horário: " +  zeroFill(now.getHours()) + ':' + zeroFill(now.getMinutes()) + ':' + zeroFill(now.getSeconds());
		// Exibe na tela usando as divs data e hora
		document.getElementById('data').innerHTML = data;
		document.getElementById('hora').innerHTML = hora;
		}, 1000);

		$("#inputName").on("input", function () {
			if($('#inputName').val() == '') {
				$("#verificado").hide()
				$("#salvar").prop("disabled", true)
			    $("#salvar").css("background","#BFBFBF")
			}else{
				$("#verificado").show();
				if(checked > 0) {
			    	$("#salvar").prop("disabled", false)
			        $("#salvar").css("background","#702094")
				}
			    else{
			    	$("#salvar").prop("disabled", true)
				    $("#salvar").css("background","#BFBFBF")
				}
			}
		})
		
		let checked = 0
		
		function checkboxAction(checkbox) {
		    if(checkbox.checked) {
		    	checked++;
		    }else{
				checked--
			}
		    if($("#verificado").text() == "check"  && $("#verificado").css("display") == "block" && checked > 0) {
		    	$("#salvar").prop("disabled", false)
		        $("#salvar").css("background","#702094")
			}
		    else{
		    	$("#salvar").prop("disabled", true)
			    $("#salvar").css("background","#BFBFBF")
			}
		};

		$("#veiculos").change(function () {
			$.ajax({
				method: "GET",
				url: '/registro/getproblemas',
				contentType: 'application/json',
				data: {name: $("#veiculos option:selected").val()},
				success: function(response) {
					$("#tabela").html("");

					$("#salvar").prop("disabled", true)
				    $("#salvar").css("background","#BFBFBF")
										
					checked = 0
					
					response.forEach((element) => {
						$("#tabela").append(
							"<tr>"+
							"<td>"+
							"<div class=" + "'custom-control'>" +
								"<input onclick='checkboxAction(this)' name=" + "'problema'" + "value='" + element.fkIdProblema + "' type=" + "'checkbox' class='" + "rounded'" + "id='" + element.fkIdProblema + "' >" +
							"</div>" +
							"</td>" +
							"<td>" + element.defeito + "</td>" + 
							"<td>" + element.peca + "</td>" +
							"</tr>"
						);
					});
			    },
			    error: function (jqXhr, textStatus, errorMessage) {
				    $("#tabela").html("");
			    }
			})
		})
	</script>
</body>
</html>