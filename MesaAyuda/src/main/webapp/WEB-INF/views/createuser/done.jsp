<b:base title="New User Complete">
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
              <li><a href="${pageContext.request.contextPath}/userlist">User List</a></li>
              <li class="active"><a href="${pageContext.request.contextPath}/newuser">New User</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

     <!-- Main component for a primary marketing message or call to action -->
     <div>
			<c:if test="${not empty warnings }">
				<c:forEach var="warning" items="${warnings }">
					<div class="alert alert-info" role="alert">${warning }</div>
				</c:forEach>
				<form method="GET" action="${pageContext.request.contextPath}/userlist">		
	    			<button type="submit" class="btn btn-default">Ir a usuarios</button>
			    </form>
			</c:if>
			<c:if test="${not empty errors }">
					<c:forEach var="error" items="${errors }">
						<div class="alert alert-danger" role="alert">${error }</div>
					</c:forEach>
					<form method="GET" action="${pageContext.request.contextPath}/newuser">		
	    			<button type="submit" class="btn btn-default">Intentar de nuevo</button>
			    </form>
			    <br/>
			     <br/>
			    <form method="GET" action="${pageContext.request.contextPath}/userlist">		
	    			<button type="submit" class="btn btn-default">Ir a usuarios</button>
			    </form>
			</c:if>	
	     		
     </div>		
     
     </div>		

    </div> <!-- /container -->
 </b:base>