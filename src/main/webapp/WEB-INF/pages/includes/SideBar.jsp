<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar" data-color="black"
	data-image="<c:url value="/resources/img/full-screen-image-0.jpg" />">
	<div class="logo">
		<a href="" class="logo-text"> TINY ERP </a>
	</div>
	<div class="logo logo-mini">
		<a href="" class="logo-text"> TE </a>
	</div>

	<div class="sidebar-wrapper">

		<div class="user">
			<div class="photo">
				<img src="<c:url value="/resources/img/default-avatar.png" />">
			</div>
			<div class="info">
				<a data-toggle="collapse" href="#collapseExample" class="collapsed">
					Group 3 <b class="caret"></b>
				</a>
				<div class="collapse" id="collapseExample">
					<ul class="nav">
						<li><a href="#">Hồ sơ</a></li>
						<li><a href="#">Chỉnh sửa</a></li>
						<li><a href="#">Thiết lập</a></li>
					</ul>
				</div>
			</div>
		</div>

		<ul class="nav">
			<li><a href=""> <i class="pe-7s-home"></i>
					<p>Trang chủ</p>
			</a></li>
			<li><a href="<c:url value="/CustomerManagement" />"> <i
					class="pe-7s-id"></i>
					<p>Quản lý khách hàng</p>
			</a></li>
			<li><a href="<c:url value="/OrderManagement" />"> <i
					class="pe-7s-cart"></i>
					<p>Quản lý đơn hàng</p>
			</a></li>
		</ul>
	</div>
</div>