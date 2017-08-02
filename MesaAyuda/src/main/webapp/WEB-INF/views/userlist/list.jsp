<b:base title="User List">
    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">CS13304</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="${pageContext.request.contextPath}">Home</a></li>
              <li><a href="${pageContext.request.contextPath}/upload">Upload</a></li>
              <li><a href="${pageContext.request.contextPath}/list">Download</a></li>
              <li class="active"><a href="${pageContext.request.contextPath}/userlist">User List</a></li>
              <li><a href="${pageContext.request.contextPath}/newuser">New User</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

     <!-- Main component for a primary marketing message or call to action -->
     <div>
     A continuaci&#243;n, se listan los usuarios enrolados.
     <c:if test="${fn:length(requestScope.usuarios) gt 0}">
     		<table class="table table-striped">
					<tr>
						<th>Usuario</th>
						<th>Nombre</th>
						<th> </th>
					</tr>		
					<c:forEach items="${usuarios}" var="element">
						<tr>							
								<td><a href="${pageContext.request.contextPath}/userlist/show?username=${element.getUsername()}">${element.getUsername()}</a></td>
								<td>${element.getFullName()}</td>
								<td>	
									<a href="${pageContext.request.contextPath}/deleteuser?username=${element.getUsername()}">			
									<span class="glyphicon glyphicon-minus-sign"></span> Eliminar
			  						</a>		  							
	  							</td>	  							
						</tr>
					</c:forEach>
				
				</table>
		</c:if>	
		<c:if test="${not empty warnings }">
				<c:forEach var="warning" items="${warnings }">
					<div class="alert alert-info" role="alert">${warning }</div>
				</c:forEach>
		</c:if>
		<c:if test="${not empty errors }">
				<c:forEach var="error" items="${errors }">
					<div class="alert alert-danger" role="alert">${error }</div>
				</c:forEach>
		</c:if>	
     </div>	

    </div> <!-- /container -->
 </b:base>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 