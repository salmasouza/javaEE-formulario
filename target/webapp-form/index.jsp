<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
 Map<String, String> erros = (Map<String, String>)request.getAttribute("erros");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulário de usuários</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h3>Formulário de usuários</h3>

<%
if(erros != null && erros.size()>0){
%>
<ul class="alert alert-danger mx-5">
<% for(String error: erros.values()){%>
<li><%=error%></li>
<%}%>
</ul>
<%}%>
<div class="px-5">
<form action="/webapp-form/registro" method="post">

  <div class="row mb-3">
    <label for="username" class="col-form-label col-sm-2">Usuário</label>
    <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control"></div>

  </div>
      <%
      if(erros != null && erros.containsKey("username")){
           out.println("<div class='row mb-3 alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("username") + "</div>");
      }
      %>
  <div class="row mb-3">
    <label for="password" class="col-form-label col-sm-2">Password</label>
    <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control"></div>
<%
    if(erros != null && erros.containsKey("password")){
         out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("password") + "</small>");
    }
    %>
  </div>
  <div class="row mb-3">
    <label for="email" class="col-form-label col-sm-2">Email</label>
    <div class="col-sm-4"><input type="text" name="email" id="email" class="form-control"></div>
    <%
        if(erros != null && erros.containsKey("email")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("email") + "</small>");
        }
        %>
  </div>
  <div class="row mb-3">
    <label for="pais" class="col-form-label col-sm-2">País</label>
    <div class="col-sm-4">
      <select name="pais" id="pais" class="form-select">
        <option value="">-- seleccionar --</option>
        <option value="BR">Brasil</option>
        <option value="CS">Coréia do Sul</option>
        <option value="CL" selected>Chile</option>
        <option value="JA">Japão</option>
      </select>
    </div>
    <%
        if(erros != null && erros.containsKey("pais")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("pais") + "</small>");
        }
        %>
  </div>

  <div class="row mb-3">
    <label for="linguagens" class="col-form-label col-sm-2">Linguagens de programação</label>
    <div class="col-sm-4">
      <select name="linguagens" id="linguagens" multiple class="form-select">
        <option value="java" selected>Java SE</option>
        <option value="jakartaee" selected>Jakarta EE9</option>
        <option value="spring">Spring Boot</option>
        <option value="js">JavaScript</option>
        <option value="angular" selected>Angular</option>
        <option value="react">React</option>
      </select>
    </div>
    <%
        if(erros != null && erros.containsKey("linguagens")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("linguagens") + "</small>");
        }
        %>
  </div>

  <div class="row mb-3">
    <label class="col-form-label col-sm-2">Roles</label>
    <div class="form-check">
      <input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input">
      <label class="form-check-label">Administrador</label>
    </div>
    <div class="form-check">
      <input type="checkbox" name="roles" value="ROLE_USER" checked class="form-check-input">
      <label class="form-check-label">Usuario</label>
    </div>
    <div class="form-check">
      <input type="checkbox" name="roles" value="ROLE_MODERATOR" class="form-check-input">
      <label class="form-check-label">Moderador</label>
    </div>
    <%
        if(erros != null && erros.containsKey("roles")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("roles") + "</small>");
        }
        %>
  </div>
  <div class="row mb-3">
    <label class="col-form-label col-sm-2">Idiomas</label>
    <div class="form-check">
      <input type="radio" name="idioma" value="pt" class="form-check-input">
      <label class="form-check-label">Português</label>
    </div>
    <div class="form-check">
      <input type="radio" name="idioma" value="en" class="form-check-input">
      <label class="form-check-label">Inglês</label>
    </div>
    <div class="form-check">
      <input type="radio" name="idioma" value="co" class="form-check-input">
      <label class="form-check-label">Coreano</label>
    </div>
    <%
        if(erros != null && erros.containsKey("idioma")){
             out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ erros.get("idioma") + "</small>");
        }
        %>
  </div>
  <div class="row mb-3">
    <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
    <div class="form-check">
      <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
    </div>
  </div>
  <div class="row mb-3">
    <div>
      <input type="submit" value="Enviar" class="btn btn-primary">
    </div>
  </div>
  <input type="hidden" name="secreto" value="12345">
</form>
</div>
</body>
</html>