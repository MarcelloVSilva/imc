<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="header.html" %>
<title>Cálculo Imc</title>
</head>
<body>
  <div class="container">
    <form class="form-horizontal">
      <fieldset>
        <legend>Imc</legend>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Peso em KG</label>
          <div class="col-md-6">
            <input id="textinput" name="peso" type="text" placeholder="Digite seu peso" class="form-control input-md" value="${param.peso}"> <span class="help-block">Peso</span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Altura em Cm</label>
          <div class="col-md-6">
            <input id="textinput" name="altura" type="text" placeholder="Digite sua altura" class="form-control input-md" value="${param.altura}"> <span class="help-block">Altura</span>
          </div>
        </div>
        <div class="form-group">
          <label class="" for="textinput">Sexo</label>
          <div class="radio">
            <input name="sexo" type="radio" value="m"> Masculino
          </div>
          <div class="radio">          
            <input name="sexo" type="radio" value="f"> Feminino
          </div>                        
        </div>        
        <div class="form-group">
          <label class="col-md-4 control-label" for=""></label>
          <div class="col-md-4">
            <button id="" name="" class="btn btn-primary">Calcular</button>
          </div>
        </div>
      </fieldset>
    </form>
    <%
      String sexo;
      sexo = request.getParameter("sexo");
      String pesoStr = request.getParameter("peso");
      pesoStr = (pesoStr==null?"0":pesoStr);

      String alturaStr = request.getParameter("altura");
      alturaStr = (alturaStr==null?"0":alturaStr);

      float altura = 1;
      int peso = 0;
      float imc = 0;
      String condicao = "teste";
      try {
        altura = Integer.parseInt(alturaStr);
        peso = Integer.parseInt(pesoStr);
      } catch (Exception e) {
      }
      if(sexo==null){
        return;
      }
      imc = peso /((altura/100)*(altura/100));
      if(sexo.equals("f")){
        if(imc<19.1){
          condicao = "abaixo do peso";
        }else if(imc>=19.1 && imc<25.8){
          condicao = "no peso normal";
        }else if(imc>=25.8 && imc<27.3){
          condicao = "marginalmente acima do peso";
        }else if(imc>=27.3 && imc<32.3){
          condicao = "acima do peso ideal";
        }else{
          condicao = "obeso";
        }
      }else {
        if(imc<20.7){
          condicao = "abaixo do peso";
        }else if(imc>=20.7 && imc<26.4){
          condicao = "no peso normal";
        }else if(imc>=26.4 && imc<27.8){
          condicao = "marginalmente acima do peso";
        }else if(imc>=27.8 && imc<31.1){
          condicao = "acima do peso ideal";
        }else{
          condicao = "obeso";
        }
      }
      
    %><div class="alert alert-warning" role="alert"> <%=imc%> </div>
      <div class="alert alert-warning" role="alert"> <%=condicao%> </div>

  </div>
</body>
</html>
