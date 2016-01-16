<cfinclude template="/includes/header.cfm"/>

<cfscript>
  controller = new services.basics.BasicsController();

  writeDump(controller.test());

</cfscript>

<style>
	
	.signature{
		height: 145px;
	}

	.row{
		margin-top: 10px;
	}

	#btnSubmit{
	    float: right;
    	margin-top: 10px;
	}
	.center-block {
		display: block;
		margin-left: auto;
		margin-right: auto;
	}

	.title{
		color: #73654c;
	}

</style>

<script>

	function validarCpf(cpf)
	{
		var digitsString = cpf.replace(/[^0-9]/g, '');
		var digits;
		var a,b,c,d,e,f,g,h,i,j,k;
		var dv1, dv2;
		var soma, resto;

		if (digitsString.length == 11)
		{
			digits = digitsString.split('');
			a = parseInt(digits[ 0 ]);
			b = parseInt(digits[ 1 ]);
			c = parseInt(digits[ 2 ]);
			d = parseInt(digits[ 3 ]);
			e = parseInt(digits[ 4 ]);
			f = parseInt(digits[ 5 ]);
			g = parseInt(digits[ 6 ]);
			h = parseInt(digits[ 7 ]);
			i = parseInt(digits[ 8 ]);
			j = parseInt(digits[ 9 ]);
			k = parseInt(digits[ 10 ]);
			soma = a*10 + b*9 + c*8 + d*7 + e*6 + f*5 + g*4 + h*3 + i*2;
			resto = soma % 11;
			dv1 = (11 - resto < 10 ? 11 - resto : 0);
			soma = a*11 + b*10 + c*9 + d*8 + e*7 + f*6 + g*5 + h*4 + i*3 + dv1*2;
			resto = soma % 11;
			dv2 = (11 - resto < 10 ? 11 - resto : 0);
			return dv1 == j && dv2 == k;
		}
		return false
	}

	function validarCnpj (cnpj)
	{
		var b = [6,5,4,3,2,9,8,7,6,5,4,3,2];
		if((cnpj = cnpj.replace(/[^\d]/g,"").split("")).length != 14) return false;
		for (var i = 0, n = 0; i < 12; n += c[i] * b[++i]); 
		if(cnpj[12] != (((n %= 11) < 2) ? 0 : 11 - n)) return false; 
		for (var i = 0, n = 0; i <= 12; n += cnpj[i] * b[i++]); 
		if(cnpj[13] != (((n %= 11) < 2) ? 0 : 11 - n)) return false; 
			return true; 
	};


	$(document).ready(function(){


	});
	
</script>



<div class="row-fluid">
	<div class="col-md-4 col-md-offset-4">
		<div class="row">
			<div class="col-md-12 text-center">
				<img class="signature" src="/img/signature.jpg">
				<h3 class="title"><b>Cadastro XPTO</b></h3>
			</div>
		</div>

		<div class="row"
			<div class="col-md-12">
				<form id="register" method="post" action="/backoffice/getting-to-know/index.cfm">
				
					<div class="row">
						<div class="col-md-12">
							<input autocomplete="off" class="form-control" name="document" type="text" placeholder="CPF/CNPJ" required>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<input autocomplete="off" class="form-control" name="name" type="text" placeholder="Nome Completo / Razão Social" required maxlength="200">
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<input autocomplete="off" class="form-control" name="email" type="email" placeholder="E-mail" required data-validity-key="email" maxlength="80">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4">
							<input autocomplete="off" class="form-control" name="ddd" maxlength="2" type="text" placeholder="DDD" required="">
						</div>
						<div class="col-md-8">
							<input autocomplete="off" class="form-control" name="phone" type="text" placeholder="Telefone" required  maxlength="10">
						</div>
					</div>

					<button id="btnSubmit" type="submit" class="btn btn-primary">Enviar</button>
				</form>
			</div>
		</div>

	</div>
</div>

<cfinclude template="/includes/footer.cfm"/>