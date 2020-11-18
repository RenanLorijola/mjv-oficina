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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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
		}
		
		a{
			text-decoration: none !important;
		}
		
		p{
			font-size: 17px !important;
			font-family: 'Catamaran', sans-serif !important;
			font-weight: 700;
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
		
		.modal.modal-static .modal-dialog {
		 -webkit-transform: none !important; transform: none !important;
		}
	</style>
</head>
<body>
	<!-- Modal -->
	<div class="modal" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-body px-5">
	        <h3 class="my-4">Cadastro de defeito</h3>
	        
	        <p class="mb-5"> Cadastre todo tipo de defeito relacionado ao veículo: </p>
	        
	        <div class="row pb-4">
	        	<div class="col-12 mb-5">
		        	<label class="w-100 mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon">
						  <span class="mdc-notched-outline">
						   <span class="mdc-notched-outline__leading"></span>
						    <span class="mdc-notched-outline__notch">
						      <span class="mdc-floating-label" id="my-label-id">Digite aqui o nome do defeito</span>
						    </span>
						    <span class="mdc-notched-outline__trailing"></span>
						  </span>
						  <i class="material-icons mdc-text-field__icon mdc-text-field__icon--leading" tabindex="0" role="button">history_edu</i>
						  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id">
						  <i class="material-icons mdc-text-field__icon mdc-text-field__icon--trailing" tabindex="0" role="button">check</i>
					</label>
	        	</div>
				<a class="col-6 my-2" href="/"><button class="mdc-button" style="color:#702094">
					  <div class="mdc-button__ripple"></div>
					  <i class="material-icons mdc-button__icon" aria-hidden="true"
					    >arrow_back</i
					  >
					  <span class="mdc-button__label">Voltar ao menu</span>
				</button></a>
				<div class="col-1"></div>
				<a class="col-5 my-2" href="/concluido"><button class="mdc-button px-3 w-100 mdc-button--raised" style="background:#702094; border-radius: 20px">
	  				<span class="mdc-button__label">Salvar</span>
				</button></a>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<script>
		$( document ).ready(function() {
			$('#staticBackdrop').modal("show");
			mdc.ripple.MDCRipple.attachTo(document.querySelector('.mdc-button'));
			mdc.textField.MDCTextField.attachTo(document.querySelector('.mdc-text-field'));
		})
	</script>
</body>
</html>