<b:base title="New User">
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
		<form class="form-horizontal" method="POST" action="new">
				<div class="form-group" >	
					 <label class="control-label col-sm-2" for="username">Usuario</label>
					 <div class="col-sm-10">
	    				 <input type="text" class="form-control" id="username" 
	    				 placeholder="Ingresa un usuario" name="username" required="true"/>
    				 </div>
    			</div>	 
    			<div class="form-group" >
    				 <label class="control-label col-sm-2" for="fullname">Nombre Completo</label>
    				 <div class="col-sm-10">
	    				 <input type="text" class="form-control" id="fullname" 
	    				 placeholder="Ingresa el nombre completo" name="fullname" required="true"/>
    			     </div>	
    			</div> 
    			<div class="form-group" >	 
    				 <label class="control-label col-sm-2" for="password">Contrase&#241;a</label>
    				 <div class="col-sm-10">
				         <input type="password" class="form-control" id="password"  
				          placeholder="*****" name="password" required="true"/>
			          </div>
				</div>
			<button type="submit" class="btn btn-default">Ingresar</button>
		    </form>
		    <br/>
     		<div>
			<c:if test="${not empty loginWarnings }">
				<c:forEach var="warning" items="${loginWarnings}">
					<div class="alert alert-info" role="alert">${warning}</div>
				</c:forEach>
			</c:if>
		</div>
     </div>		

    </div> <!-- /container -->
 </b:base>