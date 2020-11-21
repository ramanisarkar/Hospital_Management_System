<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.multiselect-container {
    width: 653px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
}
.title {
	color: white;
	padding: 8px;
}
.text{

text-align: right;
}
.ullist {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 15%;
    background-color: #364150;
    height: 100%;
    overflow: auto;
}
li a:hover:not(.active) {
    background-color: #2C3542;;
} 
.extended li a:hover:not(.active) {
    background-color: white;
} 
.nav>li>a:focus, .nav>li>a:hover {
    text-decoration: none;
    background-color: #2C3542; !important;
}

.tabcalss>li>a {
	color:#555555;
    position: relative;
    display: block;
    padding: 10px 15px;
    background-color: #f1f4f9;
}
.tabcalss>li>a:hover {
	color:#555555;
    position: relative;
    display: block;
    padding: 10px 15px;
    background-color: white;
}
#message1 {
    background: #fff none repeat scroll 0 0;
    border-left: 4px solid #7ad03a;
    box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
    margin: 5px 15px 9px;
    padding: 9px 0px 1px 13px;
}
table.dataTable thead .sorting:after, table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_desc_disabled:after {
    position: absolute;
    bottom: 8px;
    right: 8px;
    display: block;
    font-family: 'Glyphicons Halflings';
    opacity: 0.5;
}table.dataTable thead .sorting_asc:after {
    content: "\e155";
}

table.dataTable thead .sorting_desc:after {
     content: "\e156";
}
table.dataTable thead .sorting_asc:last-child:after {
    display:none !important;
}

table.dataTable thead .sorting_desc:last-child:after {
display:none !important;
}
table.dataTable thead .sorting:after {
    content: "\e156";
}
table.dataTable thead .sorting:last-child:after{
display:none !important;
}

.table th:focus {
	outline: 0 !important;
}
.table th {
    vertical-align: bottom;
    border-bottom: 2px solid #ddd;
    position: relative;
}
.dataTables_filter {
    margin-left: 301px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#example_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#example_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
.btn {
border-radius: 0px;

}

.well {
	width:170px !important;
	margin-right: 100px;
    min-height: 20px !important;
    padding: 0px !important;
    margin-bottom: 0px !important;
    background-color: #f1f4f9 !important;
    border: none !important;
    border-radius: 0px !important;
}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
    color: gray !important;
    background-color: #f1f4f9 !important;
    border: none !important;  	
}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li>a:hover {
    color: gray !important;
    background-color: #f1f4f9 !important;
    border: none !important;  	
}
.nav>li>a:focus, .nav>li>a:hover {
    text-decoration: none;
    background: none;
    border : none;
    color: #333333;
    font-weight: bold;
    !important: ;
}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li>a:hover {
    color: #333333 !important;
   
}
.icone {
  float: left;
  height: 20px !important;
  margin-right: 5px;
  overflow: hidden;
  width: 25px !important;
  text-align: center;
}
</style>
</head>

<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;font-size: 13px;">
	
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0"> 
		 <div class="navbar" style="padding-right: 14px;  background-color: white;height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="margin-top: -8px;"> <span style="font-size:21px ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;">
				<a style="background-color: white; margin-top: 17px; height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
						<img src="Admin_Images/<%=session.getAttribute("hospitalimage")%>" height="40px" width="40px" class="img-circle" style="margin-top: -15px;" >								
						<span>${q.hospitalname }</span> <b class="caret"></b>
				</a>
				<ul class="dropdown-menu extended logout">
					<li><a  href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"><i class="fa fa-user"></i>
							My Profile</a></li>
					<li><a href="Com_Login.jsp"><i class="fas fa-sign-out-alt"></i>Log Out </a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div hidden="" id="message1" class="updated below-h2"style="width: 81%;margin-left: 253px;margin-top: 27px;"><p id="messagepass"></p></div>
		<div id="message3"style="margin-top:-76px;" hidden=""></div>
		<ul class="nav nav-pills nav-stacked ullist"style="margin-top: -20px; height: 1170;">
			<li><a href="Admin_Login.jsp"><span class="icone"><img src="ing/dashboard.png"></span><span class="title">Dashboard</span></a></li>
			<li><a href="<%=request.getContextPath()%>/PatientRegistration?flag=insert&id=${q.id }"><span class="icone"><i class="fas fa fa-wheelchair" style="color: gray;"></i></span><span class="title">Patient Registration</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Department?flag=insert&id=${q.id }"><span class="icone"><i class="fas fa-briefcase" style="color: gray;"></i></span><span class="title">Department</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Specialization?flag=insert&id=${q.id }"><span class="icone"><i class="fa fa-lightbulb" style="color: gray;"></i></span><span class="title">Specialization</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Doctor?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Doctor" title="Doctor">
			<span class="icone"> <img src="ing/doctor-logo.png"></span>
			<span class="title">Doctor</span></a></li>
			
			<li><a href="" class="left-tooltip" data-tooltip="Outpatient" title="Outpatient">
			<span class="icone"> <img src="ing/outpatient-logo.png"></span>
			<span class="title">Outpatient</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/Patient?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
			<span class="icone"> <img src="ing/Patient-logo.png"></span>
			<span class="title">Inpatient</span></a></li>
			
			
			<li><a href="<%=request.getContextPath()%>/Nurse?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Nurse" title="Nurse">
			<span class="icone"> <img src="ing/Nurse-logo.png"></span>
			<span class="title">Nurse</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/SupportStaff?flag=insert&id=${q.id }"class="left-tooltip" data-tooltip="Support Staff" title="Support Staff">
			<span class="icone"> <img src="ing/support-logo.png"></span>
			<span class="title">Support Staff</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/Pharmacist?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Pharmacist" title="Pharmacist">
			<span class="icone"> <img src="ing/Pharmacist-logo.png"></span><span class="title">Pharmacist</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/Laboratory?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Laboratory Staff" title="Laboratory Staff">
			<span class="icone"> <img src="ing/Laboratorist-logo.png"></span><span class="title">Laboratory Staff</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/AccountantStaff?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Accountant" title="Accountant">
			<span class="icone"> <img src="ing/Accountant-logo.png"></span><span class="title">Accountant</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Medicine?flag=insert&id=${q.id }" data-tooltip="Medicine" title="Medicine">
			<span class="icone"> <img src="ing/Medicine-logo.png"></span><span class="title">Medicine</span></a></li>
			<li><a href="<%=request.getContextPath()%>/TreatmentUpdate?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Treatment" title="Treatment">
			<span class="icone"> <img src="ing/Treatment-logo.png"></span><span class="title">Treatment</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Prescription?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Prescription" title="Prescription">
			<span class="icone"> <img src="ing/Prescription-logo.png"></span><span class="title">Prescription</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Patient?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
			<span class="icone"><i class="fa fa-bed" aria-hidden="true" style="color: gray;"></i></span>
			<span class="title">Add Bad</span></a></li>
			<li><a href="" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
			<span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign Bed-Nurse</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Operation List" title="Operation List">
			<span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation List</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Diagnosis" title="Diagnosis">
			<span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span class="title">Diagnosis</span></a></li>
			<li><a href="<%=request.getContextPath()%>/BloodManage?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
			<span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood Bank</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
			<span class="icone"> <img src="ing/Appointment-logo.png"></span><span class="title">Appointment</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Invoice" title="Invoice">
			<span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a></li><li>
			<a href="<%=request.getContextPath()%>/Event?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Event" title="Event">
			<span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Message" title="Message">
			<span class="icone"> <img src="ing/message-logo.png"></span><span class="title">Message</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Ambulance?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
			<span class="icone"> <img src="ing/Ambulance-logo.png"></span><span class="title">Ambulance</span></a></li><li><a href="" class="left-tooltip" data-tooltip="instrument" title="instrument">
			<span class="icone"> <img src="ing/Instrument-logo.png"></span><span class="title">Instrument</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Report" title="Report">
			<span class="icone"> <img src="ing/Report-logo.png"></span><span class="title">Report</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Account" title="Account">
			<span class="icone"> <img src="ing/account-logo.png"></span><span class="title">Account</span></a></li>
		</ul>
	</c:forEach>
	<div id="message2" style="margin-top: 67px;"hidden="" ></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -73%;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div class="container" style="margin-right: 90px;">
			 <div class="row">
        <div class="col-sm-2"style="margin-left: -32px;">
            <ul  class="nav nav-tabs nav-pills nav-stacked well">
              <li ><a href="#vtab1" data-toggle="tab"><button class="btn btn-success" style="width: 140px;"> Compose</button></a></li>
              <li class="active"><a href="#vtab2" data-toggle="tab" style="text-align: center;"><i style="color: gray; padding-right: 5px;" class="fas fa-inbox"></i><span style="margin-left: 5px;color: gray;">Inbox</span></a></li>
              <li><a href="#vtab3" data-toggle="tab" style="text-align: center;"><i style="color: gray; padding-right: 5px;" class="fas fa-sign-out-alt"></i><span style="margin-left: 5px;color: gray;">Sent</span></a></li>
            </ul>
        </div>
        <div style="margin-top:-20px; margin-left: 164px;width: 94%;">
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="vtab2">
                    <h3>Inbox</h3>
                    <div style="margin-top: 30px;">
			            <table class="table" style="background-color: white;">
							<thead>
								<tr>				
									<th style="padding-left: 15px;">Message For</th>
									<th style="padding-left: 15px;">Subject</th>
									<th style="padding-left: 15px;">Description</th>
									<th style="padding-left: 15px;">Date</th>
								</tr>
							</thead>
							<tbody class="inbox">
							</tbody>
							<tfoot>
					            <tr>
									<th style="padding-left: 15px;">Message For</th>
									<th style="padding-left: 15px;">Subject</th>
									<th style="padding-left: 15px;">Description</th>
									<th style="padding-left: 15px;">Date</th>
					            </tr>
					        </tfoot>
						</table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="vtab1">
                    <h3>Compose</h3>
                    <div style="margin-top: 30px;"></div>
                    <div style="background-color: white; padding: 40px;">
	                <form id="insert_form">
	        			<div class="form-group row">
				    		<label class="col-sm-2 col-form-label text">Message To<span style="color: red;">*</span></label>
				    		<div class="col-sm-8 ">
				      			<select class="form-control " name="messageto" required="required">
									<option value="" disabled selected hidden="">Select</option>	
									<option value="patient">All Patient</option>	
									<option value="doctor">All Doctor</option>	
									<option value="nurse">All Nurse</option>
									<option value="receptionist">All Support Staff</option>		
									<option value="pharmacist">All Pharmacist</option>	
									<option value="laboratorist">All Laboratory Staff</option>	
									<option value="accountant">All Accountant</option>
									<optgroup label="patient" style="text-transform: capitalize;"><option value="118">Himanshu Patel</option><option value="178">hhhh jjjh</option><option value="187">gar gar</option><option value="148">Armando Moreno</option><option value="35">Nina Cadela</option><option value="57">R R</option><option value="104">rer e</option><option value="54">aaaa aaa</option><option value="70">aaannnnn bbb</option><option value="252">Aazib Gilani</option><option value="174">a c</option><option value="166">Muhammad Barzakh</option><option value="59">Abhijit Borgohain</option><option value="114">Abolaji Adeola</option><option value="64">Apj Kalam</option><option value="123">tee wills</option><option value="292">popopopopopopo popopopop</option><option value="283">ahmad pawan</option><option value="183">ainaa vdf</option><option value="230">Abc Gaga</option><option value="97">ashok kumar</option><option value="96">ashok kumar</option><option value="4">Ashish Ranjan</option><option value="127">Aldia Mori</option><option value="249">Alexa Alexa</option><option value="125">Alie Jalloh</option><option value="221">amadou fall</option><option value="48">Amel Ali</option><option value="128">martin gonzales</option><option value="109">Andile Zulu</option><option value="264">Pretzel Dog</option><option value="176">TEst Pateient</option><option value="7">Anna Sanz</option><option value="205">Aris Epro</option><option value="206">Aristest Epro</option><option value="193">Arjun Venugopal</option><option value="257">neera n</option><option value="302">Jonas Domarkas</option><option value="117">asdf asdf</option><option value="238">lokesh kumar</option><option value="63">Treatment Range</option><option value="250">Baji Vhankol</option><option value="237">guet Simret</option><option value="245">bhavtaodh sisodiya</option><option value="287">Michael Shobowale</option><option value="299">Bush Guya</option><option value="95">Adi Nugroho</option><option value="281">dsads Hugo</option><option value="50">gab girbaci</option><option value="233">Chim MOYO</option><option value="47">Kristopher Davis</option><option value="139">Chuks Chuks</option><option value="77">claudiu ciubotaru</option><option value="88">NiftecsPOS Ombachi</option><option value="130">Carlos Perez</option><option value="247">cuthbert matay</option><option value="110">David Urrego</option><option value="144">zain ali</option><option value="217">dddddddddd dsd</option><option value="121">diego avila</option><option value="31">akshay sarwade</option><option value="34">prayag bhaler</option><option value="141">Dominic Lelei</option><option value="228">dadad druga</option><option value="229">dand druga</option><option value="90">damien schuling</option><option value="234">sds fedf</option><option value="280">Durga Yadav</option><option value="167">Elif DENEME</option><option value="293">Emelia Brooks</option><option value="119">rrttrzzt trrezu</option><option value="225">Hoang Hai</option><option value="222">Job Finder</option><option value="289">Farhad Hossain</option><option value="199">farhat naseem</option><option value="83">Favour Isoah</option><option value="173">Fayaz Takkar</option><option value="202">Francisco Hernndez</option><option value="291">Fidelis Onyedikachi</option><option value="136">First Last</option><option value="201">Francisco Hernndez</option><option value="276">Rafa Abramowicz</option><option value="182">Frank Fre</option><option value="100">fdsfdsf dsfsdfsdf</option><option value="188">Gustavo Jaramillo</option><option value="300">Saad Saad</option><option value="86">abc def</option><option value="198">Martha Adams</option><option value="42">Joshua Altio</option><option value="41">Joshua Altio</option><option value="241">BERNARD GLOVER</option><option value="240">BERNARD GLOVER</option><option value="297">hardik patel</option><option value="298">Mukesh patel</option><option value="101">Haris Abbas</option><option value="286">Hassan Ijaz</option><option value="43">hendra wijaya</option><option value="89">matthew kargbo</option><option value="74">jong test</option><option value="131">ammar Abowath</option><option value="284">mhd sam</option><option value="106">Igor Negromonte</option><option value="105">Emran Imran</option><option value="107">ahmed ahmed</option><option value="81">Ilyas Awan</option><option value="296">imi nvbn</option><option value="295">imi jutt</option><option value="161">Eftychios Christofides</option><option value="180">Jothum Chitewe</option><option value="251">Mohammad Gamal</option><option value="92">Eugene Ciervo</option><option value="146">joaquim das gracas</option><option value="223">Johan Yani</option><option value="271">john Omebije</option><option value="274">Teachers tv</option><option value="285">Tallulah Spears</option><option value="210">Kelvin Kelvin</option><option value="273">Khen Soronio</option><option value="55">pooja chaudhery</option><option value="62">uu ui</option><option value="39">king hytrd</option><option value="87">kkk k</option><option value="242">BERNARD lover</option><option value="111">kamrunnaher koly</option><option value="112">kamrunnaher koly</option><option value="73">Kartik Bhatt</option><option value="214">A Kuddus</option><option value="99">kumar singh</option><option value="124">mahesh singh</option><option value="98">mark masai manu</option><option value="208">afasd fasdfasfd</option><option value="211">lol lolazo</option><option value="82">Johnson Landzro</option><option value="282">L T</option><option value="8">Lucas M</option><option value="301">Luis Barria</option><option value="49">Ahmed Ahme</option><option value="65">testq proba</option><option value="133">Manish Aggarwal</option><option value="134">Manish Aggarwal</option><option value="145">manoj yadav</option><option value="203">Marcos Lima</option><option value="6">Mario Rossi</option><option value="219">Marymar Perez</option><option value="69">John Owner</option><option value="103">maxmuts muutus</option><option value="142">Mazen Nasr</option><option value="157">Aminul Ahad</option><option value="279">Miha Demo</option><option value="185">Minal Patil</option><option value="186">Minal Patil</option><option value="51">test test</option><option value="181">Mueez Ahmad</option><option value="91">Mustufa Aghadi</option><option value="253">musuza kizza</option><option value="224">Jn Jnl</option><option value="236">nandhini kumar</option><option value="218">test test</option><option value="256">vishwa l</option><option value="32">prayag bhaler</option><option value="129">Olber Garces</option><option value="126">Olber reyes</option><option value="85">Onder Gulec</option><option value="84">ttttt tt</option><option value="265">h n</option><option value="5">John Mark</option><option value="177">Pablin Samel</option><option value="226">Rod Nylon</option><option value="122">Jorge Racatapunchis</option><option value="3">koly kamrunnaher</option><option value="140">Syed Zain Zaidi</option><option value="195">muhammad rafiq khan</option><option value="60">patient p</option><option value="61">patiente p</option><option value="147">Paul Osharive</option><option value="162">Pavan Suresh</option><option value="275">Pavan Yogi</option><option value="169">steven troy</option><option value="216">Phelipe Coelho</option><option value="164">pranjali tripathi</option><option value="68">test SINHA</option><option value="209">La Roca Prueba</option><option value="235">The The</option><option value="135">Qaisar Khan</option><option value="158">WERTYU QWERT</option><option value="170">Test ssss</option><option value="179">ali adas</option><option value="113">Rancho Barakiel</option><option value="94">sddsa dassss</option><option value="108">Renan Remi</option><option value="278">raj nagar</option><option value="277">raj nagar</option><option value="190">Resty Mangulabnan</option><option value="58">Nico Alderson</option><option value="231">Ryan Anthem</option><option value="288">Saif Majhar</option><option value="303">SAMIULLAH M</option><option value="263">Sammy Mati mati</option><option value="232">Samson patigas</option><option value="243">Sanjeeva reddy Somu</option><option value="168">kalanithi Saran</option><option value="132">atiqur Rahman</option><option value="172">jaddu jaddu</option><option value="53">abc PANDIT</option><option value="248">danish mehmood</option><option value="171">Shailu shukla</option><option value="29">muhammed shameem</option><option value="246">you ssef</option><option value="200">Shaukat ali</option><option value="46">Carlos Roberto Carlos Roberto</option><option value="207">behnam shoghi</option><option value="137">Simone Password</option><option value="66">mohammad khan</option><option value="79">juan juanxin</option><option value="156">Sriparna Biswas</option><option value="227">John Doe</option><option value="37">stan Ngaguthii</option><option value="175">suhasa hjh</option><option value="192">tbolaji Guyiro</option><option value="75">tan me</option><option value="44">Test Test</option><option value="196">testd test</option><option value="45">Test Test</option><option value="194">Premkumar V</option><option value="120">Test Patient</option><option value="71">testaaa testaaa</option><option value="290">Tester testerr</option><option value="254">Test User</option><option value="220">maulik patel</option><option value="215">Test First Name Test Last Name</option><option value="138">channa wick</option><option value="52">Moses Peter</option><option value="244">James W</option><option value="72">Abd ASb</option><option value="160">Thien Tran</option><option value="76">TJ med</option><option value="102">tiny tim</option><option value="40">Tony Stark</option><option value="159">Nguyen Trung</option><option value="165">ntzttztttz rtytytyrdfgfgd</option><option value="56">Ulisses Silva</option><option value="143">Bruno Guerreiro</option><option value="272">Khen Carl Soronio</option><option value="38">AS as</option><option value="67">Everton Muta</option><option value="204">Bobby Jones</option><option value="212">Nalini Marathe</option><option value="80">Vishal Singh</option><option value="27">Vivekanand Adkatalwar</option><option value="184">volodiagladiuk</option><option value="93">Le Thanh</option><option value="197">Christian Javier Soto</option><option value="294">admin dsad</option><option value="116">ergearg argaerg</option><option value="191">willliams nabare</option><option value="270">john M.</option><option value="189">yasmine ezzaher</option><option value="213">yohan rashmitha</option><option value="239">usman lodhi</option><option value="78">Zeeshan Asghar</option></optgroup>
								</select>
				    		</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label text" >Your Email id<span style="color: red;">*</span></label>
							<div class="col-sm-8">
						   		<input class="form-control" type="email" name="user" required="required">
							</div>
						</div>
			        	<div class="form-group row">
							<label class="col-sm-2 col-form-label text" >Your Email Password<span style="color: red;">*</span></label>
							<div class="col-sm-8">
							  <input class="form-control" type="password" name="pass" required="required">
							</div>
						</div>
			        	<div class="form-group row">
							<label class="col-sm-2 col-form-label text" >Subject<span style="color: red;">*</span></label>
							<div class="col-sm-8">
						   		<input class="form-control" maxlength="50" type="text" name="subject">
							</div>
						</div>
			        	<div class="form-group row">
							<label class="col-sm-2 col-form-label text" >Message Comment<span style="color: red;">*</span></label>
							<div class="col-sm-8">
							  <textarea name="message_body"  maxlength="150" class="form-control"></textarea>
							</div>
						</div>
					    <div class="form-group row">
							<div class="col-sm-4">
								<div class="pull-right">
									<input type="submit" value="Send Message" name="save_message" class="btn btn-success">
								</div>
							</div>
						</div>
	    			</form>
    				</div>
                </div>
                <div role="tabpanel" class="tab-pane fade in" id="vtab3">
	                <h3>Sent</h3>
	                <div style="margin-top: 30px;">
	                    <table class="table" style="background-color: white;">
						<thead>
								<tr>				
									<th style="padding-left: 15px;">Message For</th>
									<th style="padding-left: 15px;">Subject</th>
									<th style="padding-left: 15px;">Description</th>
								</tr>
							</thead>
							<tbody class="sent">
							</tbody>
							<tfoot>
					            <tr>
									<th style="padding-left: 15px;">Message For</th>
									<th style="padding-left: 15px;">Subject</th>
									<th style="padding-left: 15px;">Description</th>
					            </tr>
					        </tfoot>
						</table>
					</div>	
                </div>
            </div>
        </div>
        </div>
	</div>
</div>
</body>
</html>