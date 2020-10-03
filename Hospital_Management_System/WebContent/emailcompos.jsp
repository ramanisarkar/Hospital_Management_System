<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row right_side message"><!-- start dashboard content div-->
					<noscript><meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php"></noscript> 

<div class="row mailbox-header"><!-- START MAIL BOX HEADER DIV-->
								
	<div class="col-md-2">
			
			<a class="btn btn-success btn-block" href="?dashboard=user&amp;page=message&amp;tab=compose">Compose</a>
			
	</div>
	<div class="col-md-6">
		<h2>
		Compose	
		
		</h2>
	</div>
   
</div><!-- END MAIL BOX HEADER DIV-->
 <div class="col-md-2">
	<ul class="list-unstyled mailbox-nav">
		<li>
		<a href="?dashboard=user&amp;page=message&amp;tab=inbox"><i class="fa fa-inbox"></i> Inbox<span class="badge badge-success pull-right">2</span></a></li>
		<li><a href="?dashboard=user&amp;page=message&amp;tab=sentbox"><i class="fa fa-sign-out"></i>Sent</a></li>                                
	</ul>
</div>
 <div class="col-md-10">
 	<noscript><meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php"></noscript> 
<script type="text/javascript">

$(document).ready(function() {
	$('#message_form').validationEngine({promptPosition : "bottomRight",maxErrorsPerField: 1});
} );
</script>
<div class="mailbox-content"><!-- START MAIL BOX CONTENT DIV -->
	<h2>
		</h2>
		<form name="message_form" action="" method="post" class="form-horizontal" id="message_form"><!-- START MESSAGE FORM -->
        		<input type="hidden" name="action" value="insert">
        <div class="form-group">
			<label class="col-sm-2 control-label" for="to">Message To<span class="require-field">*</span></label>
			<div class="col-sm-8">
			
			<select name="receiver" class="form-control validate[required] text-input" id="to">
					<option value="patient">All Patient</option>	
					<option value="doctor">All Doctor</option>	
					<option value="nurse">All Nurse</option>
					<option value="receptionist">All Support Staff</option>		
					<option value="pharmacist">All Pharmacist</option>	
					<option value="laboratorist">All Laboratory Staff</option>	
					<option value="accountant">All Accountant</option>
													<optgroup label="patient" style="text-transform: capitalize;"><option value="118">Himanshu Patel</option><option value="178">hhhh jjjh</option><option value="187">gar gar</option><option value="148">Armando Moreno</option><option value="35">Nina Cadela</option><option value="57">R R</option><option value="104">rer e</option><option value="54">aaaa aaa</option><option value="70">aaannnnn bbb</option><option value="252">Aazib Gilani</option><option value="174">a c</option><option value="166">Muhammad Barzakh</option><option value="59">Abhijit Borgohain</option><option value="114">Abolaji Adeola</option><option value="64">Apj Kalam</option><option value="123">tee wills</option><option value="292">popopopopopopo popopopop</option><option value="283">ahmad pawan</option><option value="183">ainaa vdf</option><option value="230">Abc Gaga</option><option value="97">ashok kumar</option><option value="96">ashok kumar</option><option value="4">Ashish Ranjan</option><option value="127">Aldia Mori</option><option value="249">Alexa Alexa</option><option value="125">Alie Jalloh</option><option value="221">amadou fall</option><option value="48">Amel Ali</option><option value="128">martin gonzales</option><option value="109">Andile Zulu</option><option value="264">Pretzel Dog</option><option value="176">TEst Pateient</option><option value="7">Anna Sanz</option><option value="205">Aris Epro</option><option value="206">Aristest Epro</option><option value="193">Arjun Venugopal</option><option value="257">neera n</option><option value="302">Jonas Domarkas</option><option value="117">asdf asdf</option><option value="238">lokesh kumar</option><option value="63">Treatment Range</option><option value="250">Baji Vhankol</option><option value="237">guet Simret</option><option value="245">bhavtaodh sisodiya</option><option value="287">Michael Shobowale</option><option value="299">Bush Guya</option><option value="95">Adi Nugroho</option><option value="281">dsads Hugo</option><option value="50">gab girbaci</option><option value="233">Chim MOYO</option><option value="47">Kristopher Davis</option><option value="139">Chuks Chuks</option><option value="77">claudiu ciubotaru</option><option value="88">NiftecsPOS Ombachi</option><option value="130">Carlos Perez</option><option value="247">cuthbert matay</option><option value="110">David Urrego</option><option value="144">zain ali</option><option value="217">dddddddddd dsd</option><option value="121">diego avila</option><option value="31">akshay sarwade</option><option value="34">prayag bhaler</option><option value="141">Dominic Lelei</option><option value="228">dadad druga</option><option value="229">dand druga</option><option value="90">damien schuling</option><option value="234">sds fedf</option><option value="280">Durga Yadav</option><option value="167">Elif DENEME</option><option value="293">Emelia Brooks</option><option value="119">rrttrzzt trrezu</option><option value="225">Hoang Hai</option><option value="222">Job Finder</option><option value="289">Farhad Hossain</option><option value="199">farhat naseem</option><option value="83">Favour Isoah</option><option value="173">Fayaz Takkar</option><option value="202">Francisco Hernndez</option><option value="291">Fidelis Onyedikachi</option><option value="136">First Last</option><option value="201">Francisco Hernndez</option><option value="276">Rafa Abramowicz</option><option value="182">Frank Fre</option><option value="100">fdsfdsf dsfsdfsdf</option><option value="188">Gustavo Jaramillo</option><option value="300">Saad Saad</option><option value="86">abc def</option><option value="198">Martha Adams</option><option value="42">Joshua Altio</option><option value="41">Joshua Altio</option><option value="241">BERNARD GLOVER</option><option value="240">BERNARD GLOVER</option><option value="297">hardik patel</option><option value="298">Mukesh patel</option><option value="101">Haris Abbas</option><option value="286">Hassan Ijaz</option><option value="43">hendra wijaya</option><option value="89">matthew kargbo</option><option value="74">jong test</option><option value="131">ammar Abowath</option><option value="284">mhd sam</option><option value="106">Igor Negromonte</option><option value="105">Emran Imran</option><option value="107">ahmed ahmed</option><option value="81">Ilyas Awan</option><option value="296">imi nvbn</option><option value="295">imi jutt</option><option value="161">Eftychios Christofides</option><option value="180">Jothum Chitewe</option><option value="251">Mohammad Gamal</option><option value="92">Eugene Ciervo</option><option value="146">joaquim das gracas</option><option value="223">Johan Yani</option><option value="271">john Omebije</option><option value="274">Teachers tv</option><option value="285">Tallulah Spears</option><option value="210">Kelvin Kelvin</option><option value="273">Khen Soronio</option><option value="55">pooja chaudhery</option><option value="62">uu ui</option><option value="39">king hytrd</option><option value="87">kkk k</option><option value="242">BERNARD lover</option><option value="111">kamrunnaher koly</option><option value="112">kamrunnaher koly</option><option value="73">Kartik Bhatt</option><option value="214">A Kuddus</option><option value="99">kumar singh</option><option value="124">mahesh singh</option><option value="98">mark masai manu</option><option value="208">afasd fasdfasfd</option><option value="211">lol lolazo</option><option value="82">Johnson Landzro</option><option value="282">L T</option><option value="8">Lucas M</option><option value="301">Luis Barria</option><option value="49">Ahmed Ahme</option><option value="65">testq proba</option><option value="133">Manish Aggarwal</option><option value="134">Manish Aggarwal</option><option value="145">manoj yadav</option><option value="203">Marcos Lima</option><option value="6">Mario Rossi</option><option value="219">Marymar Perez</option><option value="69">John Owner</option><option value="103">maxmuts muutus</option><option value="142">Mazen Nasr</option><option value="157">Aminul Ahad</option><option value="279">Miha Demo</option><option value="185">Minal Patil</option><option value="186">Minal Patil</option><option value="51">test test</option><option value="181">Mueez Ahmad</option><option value="91">Mustufa Aghadi</option><option value="253">musuza kizza</option><option value="224">Jn Jnl</option><option value="236">nandhini kumar</option><option value="218">test test</option><option value="256">vishwa l</option><option value="32">prayag bhaler</option><option value="129">Olber Garces</option><option value="126">Olber reyes</option><option value="85">Onder Gulec</option><option value="84">ttttt tt</option><option value="265">h n</option><option value="5">John Mark</option><option value="177">Pablin Samel</option><option value="226">Rod Nylon</option><option value="122">Jorge Racatapunchis</option><option value="3">koly kamrunnaher</option><option value="140">Syed Zain Zaidi</option><option value="195">muhammad rafiq khan</option><option value="60">patient p</option><option value="61">patiente p</option><option value="147">Paul Osharive</option><option value="162">Pavan Suresh</option><option value="275">Pavan Yogi</option><option value="169">steven troy</option><option value="216">Phelipe Coelho</option><option value="164">pranjali tripathi</option><option value="68">test SINHA</option><option value="209">La Roca Prueba</option><option value="235">The The</option><option value="135">Qaisar Khan</option><option value="158">WERTYU QWERT</option><option value="170">Test ssss</option><option value="179">ali adas</option><option value="113">Rancho Barakiel</option><option value="94">sddsa dassss</option><option value="108">Renan Remi</option><option value="278">raj nagar</option><option value="277">raj nagar</option><option value="190">Resty Mangulabnan</option><option value="58">Nico Alderson</option><option value="231">Ryan Anthem</option><option value="288">Saif Majhar</option><option value="303">SAMIULLAH M</option><option value="263">Sammy Mati mati</option><option value="232">Samson patigas</option><option value="243">Sanjeeva reddy Somu</option><option value="168">kalanithi Saran</option><option value="132">atiqur Rahman</option><option value="172">jaddu jaddu</option><option value="53">abc PANDIT</option><option value="248">danish mehmood</option><option value="171">Shailu shukla</option><option value="29">muhammed shameem</option><option value="246">you ssef</option><option value="200">Shaukat ali</option><option value="46">Carlos Roberto Carlos Roberto</option><option value="207">behnam shoghi</option><option value="137">Simone Password</option><option value="66">mohammad khan</option><option value="79">juan juanxin</option><option value="156">Sriparna Biswas</option><option value="227">John Doe</option><option value="37">stan Ngaguthii</option><option value="175">suhasa hjh</option><option value="192">tbolaji Guyiro</option><option value="75">tan me</option><option value="44">Test Test</option><option value="196">testd test</option><option value="45">Test Test</option><option value="194">Premkumar V</option><option value="120">Test Patient</option><option value="71">testaaa testaaa</option><option value="290">Tester testerr</option><option value="254">Test User</option><option value="220">maulik patel</option><option value="215">Test First Name Test Last Name</option><option value="138">channa wick</option><option value="52">Moses Peter</option><option value="244">James W</option><option value="72">Abd ASb</option><option value="160">Thien Tran</option><option value="76">TJ med</option><option value="102">tiny tim</option><option value="40">Tony Stark</option><option value="159">Nguyen Trung</option><option value="165">ntzttztttz rtytytyrdfgfgd</option><option value="56">Ulisses Silva</option><option value="143">Bruno Guerreiro</option><option value="272">Khen Carl Soronio</option><option value="38">AS as</option><option value="67">Everton Muta</option><option value="204">Bobby Jones</option><option value="212">Nalini Marathe</option><option value="80">Vishal Singh</option><option value="27">Vivekanand Adkatalwar</option><option value="184">volodiagladiuk</option><option value="93">Le Thanh</option><option value="197">Christian Javier Soto</option><option value="294">admin dsad</option><option value="116">ergearg argaerg</option><option value="191">willliams nabare</option><option value="270">john M.</option><option value="189">yasmine ezzaher</option><option value="213">yohan rashmitha</option><option value="239">usman lodhi</option><option value="78">Zeeshan Asghar</option>				</optgroup></select>
			</div>	
		</div>
        <div class="form-group">
			<label class="col-sm-2 control-label" for="subject">Subject<span class="require-field">*</span></label>
			<div class="col-sm-8">
			   <input id="subject" class="form-control validate[required,custom[popup_category_validation]] text-input" maxlength="50" type="text" name="subject">
			</div>
		</div>
        <div class="form-group">
			<label class="col-sm-2 control-label" for="subject">Message Comment<span class="require-field">*</span></label>
			<div class="col-sm-8">
			  <textarea name="message_body" id="message_body" maxlength="150" class="form-control validate[required,custom[address_description_validation]] text-input"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label " for="enable">Send SMS</label>
			<div class="col-sm-8">
				 <div class="checkbox">
				 	<label>
  						<input id="chk_sms_sent" type="checkbox" value="1" name="hmgt_sms_service_enable">
  					</label>
  				</div>				 
			</div>
		</div>
		<input type="hidden" id="_wpnonce" name="_wpnonce" value="3e727aac53"><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=message&amp;tab=compose">		<div id="hmsg_message_sent" class="hmsg_message_none">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="sms_template">SMS Text<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<textarea name="sms_template" class="form-control validate[required,custom[address_description_validation]]" maxlength="160"></textarea>
				<label>Max. 160 Character</label>
			</div>
		</div>
		</div>
        <div class="form-group">
			<div class="col-sm-10">
				<div class="pull-right">
					<input type="submit" value="Send Message" name="save_message" class="btn btn-success">
				</div>
			</div>
		</div>
    </form> <!-- END MESSAGE FORM -->       
</div><!-- START MAIL BOX CONTENT DIV --> </div></div>
</body>
</html>