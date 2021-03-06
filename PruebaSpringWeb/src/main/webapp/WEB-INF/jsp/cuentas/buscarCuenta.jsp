<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>
            function buscar()
            {
                var xmlhttp;

                xmlhttp = new XMLHttpRequest();

                var formElement = document.getElementById("cuentaForm");

                xmlhttp.onreadystatechange = obtenerResultadoBusqueda;
                xmlhttp.open(formElement.method, formElement.action, true);
                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xmlhttp.send($("#cuentaForm").serialize());
            }

            function obtenerResultadoBusqueda() {
                if (this.readyState === this.DONE) {
                    if (this.status === 200) {
                        // success!
                        document.getElementById("idResultado").innerHTML = this.responseText;
                    }
                    else {
                        // something went wrong
                        document.getElementById("error").innerHTML = this.responseText;
                    }
                }
            }
        </script>
    </head>
    <body>
        <h1>Buscador de cuentas</h1>
        <form:form id="cuentaForm" commandName="cuenta" action="mostrarCuenta">
            <table>
                <tr>
                    <td>Identificador</td>
                    <td><form:input path="id" /></td>
                </tr>
                <tr>
                    <td>Descripcion</td>
                    <td><form:input path="descripcion" /></td>
                </tr>
                <tr>
                    <td>Nombre titular</td>
                    <td><form:input path="titular.nombre" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!--    -->
                        <input type="button" value="Buscar" onclick="buscar()"/>

                        <!-- 
                        <input type="submit" value="Buscar">
                        -->
                    </td>
                </tr>
            </table>
        </form:form>
        <div>RESULTADOS</div>
        <div id="idResultado"></div>
        <div id="error"></div>
</html>
