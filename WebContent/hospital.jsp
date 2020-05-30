<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page errorPage="wentWrong.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="myweb.db" %>
    <%@ page errorPage="wentWrong.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Search Hospital</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<div class="w3-top">
  <div class="w3-row w3-large w3-light-grey">
    <div class="w3-col s3">
      <a href="index.jsp" class="w3-button w3-block">Home</a>
    </div>
    <div class="w3-col s3">
      <a href="blood.jsp" class="w3-button w3-block"><img width=20 height=15 src="data:image/jpeg;base64,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">Bank</a>
       </div>
    <div class="w3-col s3">
      <a href="hospital.jsp" class="w3-button w3-block">Hospital</a>
    </div>
    <div class="w3-col s3">
      <a href="login.jsp" class="w3-button w3-block">Login</a>
    </div>
    
  </div>
</div>
<br>
<br>
<div class="container p-3 text-center">
<h2 align="center">Search Hospital In Your City</h2>

<form class="example" action="hospital.jsp" method="post">
  <input type="text" placeholder="Enter City" name="search" list="name">
  <datalist id="name">
  
<option value="Adilabad">
<option value="Agra">
<option value="Ahmedabad">
<option value="Ahmednagar">
<option value="Aizawl">
<option value="Ajmer">
<option value="Akola">
<option value="Alappuzha">
<option value="Aligarh">
<option value="Almora">
<option value="Alwar">
<option value="Ambala">
<option value="Amravati">
<option value="Amreli">
<option value="Amritsar">
<option value="Anand">
<option value="Anantapur">
<option value="Anantnag">
<option value="Angul">
<option value="Anuppur">
<option value="Araria">
<option value="Ariyalur">
<option value="Arwal">
<option value="Aurangabad">
<option value="Bagalkot">
<option value="Bageshwar">
<option value="Balaghat">
<option value="Balangir">
<option value="Baleswar">
<option value="Ballari">
<option value="Banas kantha">
<option value="Banka">
<option value="Bankura">
<option value="Banswara">
<option value="Baramulla">
<option value="Baran">
<option value="Bardhaman">
<option value="Bargarh">
<option value="Barmer">
<option value="Barnala">
<option value="Barpeta">
<option value="Barwani">
<option value="Bastar">
<option value="Bathinda">
<option value="Beed">
<option value="Begusarai">
<option value="Belagavi">
<option value="Bengaluru Rural">
<option value="Bengaluru Urban">
<option value="Betul">
<option value="Bhadrak">
<option value="Bhagalpur">
<option value="Bhandara">
<option value="Bharatpur">
<option value="Bharuch">
<option value="Bhavnagar">
<option value="Bhilwara">
<option value="Bhind">
<option value="Bhiwani">
<option value="Bhojpur">
<option value="Bhopal">
<option value="Bidar">
<option value="Bijapur">
<option value="Bikaner">
<option value="Bilaspur">
<option value="Birbhum">
<option value="Bokaro">
<option value="Bongaigaon">
<option value="Boudh">
<option value="Budgam">
<option value="Buldhana">
<option value="Bundi">
<option value="Burahanpur">
<option value="Burhanpur">
<option value="Buxar">
<option value="Cachar">
<option value="Chamarajanagar">
<option value="Chamba">
<option value="Chamoli">
<option value="Champawat">
<option value="Champhai">
<option value="Chandigarh">
<option value="Chandrapur">
<option value="Chatra">
<option value="Chennai">
<option value="Chhatarpur">
<option value="Chhindwara">
<option value="Chikkaballapur">
<option value="Chikkamagaluru">
<option value="Chitradurga">
<option value="Chittoor">
<option value="Chittorgarh">
<option value="Churachandpur">
<option value="Churu">
<option value="Coimbatore">
<option value="Cuddalore">
<option value="Cuttack">
<option value="Dadra and Nagar Haveli">
<option value="Dahod">
<option value="Dakshina Kannada">
<option value="Daman">
<option value="Damoh">
<option value="Dang">
<option value="Dantewada">
<option value="Darbhanga">
<option value="Darrang">
<option value="Datia">
<option value="Dausa">
<option value="Davangere">
<option value="Dehradun">
<option value="Deoghar">
<option value="Dewas">
<option value="Dhalai">
<option value="Dhamtari">
<option value="Dhanbad">
<option value="Dhar">
<option value="Dharmapuri">
<option value="Dharwad">
<option value="Dhemaji">
<option value="Dhenkanal">
<option value="Dholpur">
<option value="Dhubri">
<option value="Dhule">
<option value="Dibrugarh">
<option value="Dima Hasao">
<option value="Dimapur">
<option value="Dindigul">
<option value="Doda">
<option value="Dumka">
<option value="Dungarpur">
<option value="Durg">
<option value="East Champaran">
<option value="East Garo Hills">
<option value="East Godavari">
<option value="East Khasi Hills">
<option value="East Siang">
<option value="East Sikkim">
<option value="East Singhbhum">
<option value="Ernakulam">
<option value="Erode">
<option value="Faridabad">
<option value="Faridkot">
<option value="Fatehabad">
<option value="Fatehgarh Sahib">
<option value="Firozpur">
<option value="Gadag">
<option value="Gajapati">
<option value="Gandhinagar">
<option value="Ganganagar">
<option value="Ganjam">
<option value="Garhwa">
<option value="Gaya">
<option value="Giridih">
<option value="Goalpara">
<option value="Godda">
<option value="Golaghat">
<option value="Gopalganj">
<option value="Gulbarga">
<option value="Gumla">
<option value="Guna">
<option value="Guntur">
<option value="Gurdaspur">
<option value="Gurgaon">
<option value="Gwalior">
<option value="Hamirpur">
<option value="Hanumangarh">
<option value="Harda">
<option value="Haridwar">
<option value="Hassan">
<option value="Haveri">
<option value="Hazaribag">
<option value="Hisar">
<option value="Hoshangabad">
<option value="Hoshiarpur">
<option value="Hyderabad">
<option value="Idukki">
<option value="Imphal East">
<option value="Imphal West">
<option value="Indore">
<option value="Jabalpur">
<option value="Jagatsinghapur">
<option value="Jaintia Hills">
<option value="Jaipur">
<option value="Jaisalmer">
<option value="Jajapur">
<option value="Jalandhar">
<option value="Jalgaon">
<option value="Jalna">
<option value="Jalore">
<option value="Jammu">
<option value="Jamnagar">
<option value="Jamtara">
<option value="Jamui">
<option value="Janjgir-Champa">
<option value="Jashpur">
<option value="Jehanabad">
<option value="Jhabua">
<option value="Jhajjar">
<option value="Jhalawar">
<option value="Jharsuguda">
<option value="Jhunjhunu">
<option value="Jind">
<option value="Jodhpur">
<option value="Jorhat">
<option value="Junagadh">
<option value="Kabirdham">
<option value="Kachchh">
<option value="Kaimur (Bhabua)">
<option value="Kaithal">
<option value="Kalahandi">
<option value="Kamrup">
<option value="Kamrup Metro">
<option value="Kanchipuram">
<option value="Kandhamal">
<option value="Kangra">
<option value="Kanker">
<option value="Kanniyakumari">
<option value="Kannur">
<option value="Kapurthala">
<option value="Karaikal">
<option value="Karauli">
<option value="Karbi Anglong">
<option value="Karimnagar">
<option value="Karnal">
<option value="Karur">
<option value="Kasaragod">
<option value="Kathua">
<option value="Katihar">
<option value="Katni">
<option value="Kendrapara">
<option value="Kendujhar">
<option value="Khagaria">
<option value="Khammam">
<option value="Khandwa">
<option value="Khargone">
<option value="Kheda">
<option value="Khordha">
<option value="Khunti">
<option value="Kinnaur">
<option value="Kishanganj">
<option value="Kodagu">
<option value="Koderma">
<option value="Kohima">
<option value="Kokrajhar">
<option value="Kolar">
<option value="Kolasib">
<option value="Kolhapur">
<option value="Kolkata">
<option value="Kollam">
<option value="Koppal">
<option value="Koraput">
<option value="Korba">
<option value="Korea">
<option value="Kota">
<option value="Kottayam">
<option value="Kozhikode">
<option value="Krishna">
<option value="Krishnagiri">
<option value="Kullu">
<option value="Kurnool">
<option value="Kurukshetra">
<option value="Lahaul and Spiti">
<option value="Lakhimpur">
<option value="Lakhisarai">
<option value="Lakshadweep">
<option value="Latehar">
<option value="Latur">
<option value="Lawngtlai">
<option value="Lohardaga">
<option value="Lower Subansiri">
<option value="Ludhiana">
<option value="Lunglei">
<option value="Madhepura">
<option value="Madhubani">
<option value="Madurai">
<option value="Mahabubnagar">
<option value="Mahasamund">
<option value="Mahendragarh">
<option value="Mahesana">
<option value="Malappuram">
<option value="Malkangiri">
<option value="Mamit">
<option value="Mandi">
<option value="Mandsaur">
<option value="Mandya">
<option value="Mansa">
<option value="Marigaon">
<option value="Mayurbhanj">
<option value="Medak">
<option value="Mewat">
<option value="Moga">
<option value="Mokokchung">
<option value="Morena">
<option value="Mumbai">
<option value="Mungeli">
<option value="Munger">
<option value="Muzaffarpur">
<option value="Muzzffarpur">
<option value="Mysuru">
<option value="Nabarangpur">
<option value="Nagaon">
<option value="Nagapattinam">
<option value="Nagaur">
<option value="Nagpur">
<option value="Nainital">
<option value="Nalanda">
<option value="Nalbari">
<option value="Nalgonda">
<option value="Namakkal">
<option value="Nanded">
<option value="Nandurbar">
<option value="Narayanpur">
<option value="Narmada">
<option value="Narsinghpur">
<option value="Nashik">
<option value="Navsari">
<option value="Nawada">
<option value="Nawanshahr">
<option value="Nayagarh">
<option value="Neemuch">
<option value="Nizamabad">
<option value="North Goa">
<option value="North Tripura">
<option value="Nuapada">
<option value="Osmanabad">
<option value="Pakur">
<option value="Palakkad">
<option value="Palamu">
<option value="Palghar">
<option value="Pali">
<option value="Palwal">
<option value="Panchkula">
<option value="Panchmahal">
<option value="Panipat">
<option value="Panna">
<option value="Papum Pare">
<option value="Parbhani">
<option value="Patan">
<option value="Pathanamthitta">
<option value="Patiala">
<option value="Patna">
<option value="Pauri Garhwal">
<option value="Perambalur">
<option value="Perintalmanna">
<option value="Pithoragarh">
<option value="Porbandar">
<option value="Prakasam">
<option value="Puducherry">
<option value="Pudukkottai">
<option value="Pulwama">
<option value="Pune">
<option value="Puri">
<option value="Purnia">
<option value="Raichur">
<option value="Raigarh">
<option value="Raipur">
<option value="Raisen">
<option value="Rajgarh">
<option value="Rajkot">
<option value="Rajnandgaon">
<option value="Rajsamand">
<option value="Ramanagara">
<option value="Ramanathapuram">
<option value="Ramgarh">
<option value="Ranchi">
<option value="Ranga Reddy">
<option value="Ratlam">
<option value="Ratnagiri">
<option value="Rayagada">
<option value="Rewa">
<option value="Rewari">
<option value="Ri Bhoi">
<option value="Rohtak">
<option value="Rohtas">
<option value="Rudraprayag">
<option value="Rupnagar">
<option value="S.A.S Nagar">
<option value="Sabar kantha">
<option value="Sagar">
<option value="Saharsa">
<option value="Sahibganj">
<option value="Saiha">
<option value="Salem">
<option value="Samastipur">
<option value="Sambalpur">
<option value="Sangli">
<option value="Sangrur">
<option value="Saran">
<option value="Satara">
<option value="Satna">
<option value="Sawai Madhopur">
<option value="Sehore">
<option value="Seoni">
<option value="Seraikella-Kharsawan">
<option value="Serchhip">
<option value="Shadol">
<option value="Shahdol">
<option value="Shahjahanpur">
<option value="Shajapur">
<option value="Sheikhpura">
<option value="Sheohar">
<option value="Shimla">
<option value="Shivamogga">
<option value="Shivpuri">
<option value="Shravasti">
<option value="Siddharth Nagar">
<option value="Sidhi">
<option value="Sikar">
<option value="Simdega">
<option value="Sindhudurg">
<option value="Singrauli">
<option value="Sirmaur">
<option value="Sirohi">
<option value="Sirsa">
<option value="Sitamarhi">
<option value="Sitapur">
<option value="Sivaganga">
<option value="Sivasagar">
<option value="Siwan">
<option value="Solan">
<option value="Solapur">
<option value="Sonbhadra">
<option value="Sonepur">
<option value="Sonipat">
<option value="Sonitpur">
<option value="South Andaman">
<option value="South Goa">
<option value="South Tripura">
<option value="SPSR Nellore">
<option value="Sri Muktsar Sahib">
<option value="Srikakulam">
<option value="Srinagar">
<option value="Sultanpur">
<option value="Sundargarh">
<option value="Supaul">
<option value="Surat">
<option value="Surendranagar">
<option value="Surguja">
<option value="Tapi">
<option value="Tarn Taran">
<option value="Tawang">
<option value="Tehri Garhwal">
<option value="Thane">
<option value="Thanjavur">
<option value="The Nilgiris">
<option value="Theni">
<option value="Thiruvananthapuram">
<option value="Thoubal">
<option value="Thrissur">
<option value="Tikamgarh">
<option value="Tinsukia">
<option value="Tiruchirappalli">
<option value="Tirunelveli">
<option value="Tiruvallur">
<option value="Tiruvannamalai">
<option value="Tiruvarur">
<option value="Tonk">
<option value="Tuensang">
<option value="Tumakuru">
<option value="Tuticorin">
<option value="Udaipur">
<option value="Udham Singh Nagar">
<option value="Udhampur">
<option value="Udupi">
<option value="Ujjain">
<option value="Umaria">
<option value="Una">
<option value="Unnao">
<option value="Upper Subansiri">
<option value="Uttara Kannada">
<option value="Uttarkashi">
<option value="Vadodara">
<option value="Vaishali">
<option value="Valsad">
<option value="Varanasi">
<option value="Vellore">
<option value="Vidisha">
<option value="Vijayapura">
<option value="Villupuram">
<option value="Virudhunagar">
<option value="Visakhapatnam">
<option value="Vizianagaram">
<option value="Warangal">
<option value="Wardha">
<option value="Washim">
<option value="Wayanad">
<option value="West Champaran">
<option value="West Garo Hills">
<option value="West Godavari">
<option value="West Khasi Hills">
<option value="West Singhbhum">
<option value="West Tripura">
<option value="Wokha">
<option value="Y.S.R.">
<option value="Yadgir">
<option value="Yamunanagar">
<option value="Yavatmal">
<option value="Zunheboto">
  </datalist>
  <button type="submit" onchange="this.form.submit()"><i class="fa fa-search"></i></button>
</form>
<br>
</div>
<%
try
{  
	int count=1;
	db d=new db();
	Connection con=d.getConnection();
	Statement stm=con.createStatement();
	ResultSet rs=stm.executeQuery("select * from hospital where lower(District) like '%"+request.getParameter("search")+"%' or upper(District) like '%"+request.getParameter("search")+"%' or concat(upper(substring(District,1,1)),lower(substring(District,2))) like '%"+request.getParameter("search")+"%'");
	while(rs.next())
	{
		if(count==1)
		{
			%>
			<table border="1">
<tr>
     <th>Name</th>
     <th>Address</th>
     <th>Contact Number</th>
</tr>
			<% 
			count=count+1;
		}
		%>
		<tr>
       <td><%= rs.getString("Name") %></td>
       <td><%= rs.getString("Address") %></td>
       <td><%= rs.getString("Telephone") %></td>
       </tr>
		
		<%
	}
	rs.close();
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}


%>




</table>



</body>
</html>