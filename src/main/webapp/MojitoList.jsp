<%-- 
    Document   : Mojito
    Created on : 14/09/2021, 9:42:55 a. m.
    Author     : PERSONAL
--%>

<%@page import="Logica.ColeccionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Productos" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <title>JSP Page</title>

        <style>
            body{
                font-family: Arial, Helvetica, sans-serif;
                margin: auto;
                background-color: #f9fcf0;
            }

            .container{
                padding-top: 150px;
                margin: auto;
                text-align: center;
            }
            
            #btnAddPrdct{
                margin: 4px;
            }

            .titulo h2 {
                padding-bottom: 6px;
                border-bottom: 1px solid black;
                text-align: left;
            }

            .busqueda {
                margin-bottom: 15px;
                text-align: left;
            }

            .table {
                margin-top: 0px;
                border-top: 1px solid black;
            }

            input[type="text"] {
                margin: 4px;
                font-size: 20px;
                width: 70%;
                border-radius: 4px;
                text-align: left;
            }

        </style>

    </head>
    <body>

        <div class="container">
            <div class="titulo">
                <h2>Lista de Ingredientes</h2>
            </div>
            <%
            String filtro = request.getParameter("txtFiltro")==null ? "" : request.getParameter("txtFiltro");
            %>
            <div class="busqueda">
                <form method="GET" action="">
                <input type="text" name="txtFiltro" id="txtFiltro" placeholder="Consultar">
                <button type="submit"class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
                <a href="Mojito_form.jsp?accion=nuevo&id=0"> <button type="button" id="btnAddPrdct" class="btn btn-info" >Agregar producto</button></a>  
                </form>
            
            </div>
            

            <div class="table">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Nombre</th>
                            <th>Unidad de medida</th>
                            <th>Cantidad</th>
                            <th>Origen ingredientes</th>
                            <th>Acción</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%                           
                            ColeccionProducto coleccion = new ColeccionProducto();
                            boolean hayDatos;
                            if (filtro.equals("")){
                                hayDatos = coleccion.cargarProductos();
                            }else{
                                hayDatos = coleccion.cargarProductosFiltro(filtro);
                            }
                            
                            if (hayDatos) {

                                for (Productos j : coleccion.getLista()) {
                        %>
                        <tr>
                            <td><%= j.getIdIngredients()%></td>
                            <td><%= j.getNombre()%></td>
                            <td><%= coleccion.getUnidadesMedida(j.getUnidadMedida()) %></td>
                            <td><%= j.getCantidad()%></td>
                            <td><%=  coleccion.getTipoProducto(j.getTipoMateriaPrima())%></td>
                            <td><a href="Mojito_form.jsp?accion=editar&id=<%=j.getIdIngredients()%>"><button type="button" class="btn btn-info"><i class="fas fa-edit"></i></button></a>
                                <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button></td>
                        </tr>
                        <%
                            }
          
                        } else {
                        %>
                        <tr>
                            <td colspan="5">No hay datos</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
