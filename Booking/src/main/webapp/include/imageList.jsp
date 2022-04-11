<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-default" id="shadow2">
	<div class="panel-heading">
		<h3>이미지</h3>
	</div>
	<div class="panel-body">
		<div class="row" >
			<c:forEach items="${imageList }" var="vo" >
				<div class="col-md-4" id="shadow">
				  <div class="thumbnail imageDataRow" data-no="${vo.no}" >
						<img src="${vo.fileName}" alt="Photo Lists" style="width: 100%; height:300px">
						<div class="caption">
							<p>[${vo.no}]&nbsp;${vo.title}</p>
							${vo.name}(${vo.id})&nbsp;&nbsp;<span style="color:#cccccc">|</span>&nbsp;&nbsp;${vo.writeDate}
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>