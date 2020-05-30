<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="myweb.db" %>
    <%@ page errorPage="wentWrong.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Blood Bank</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

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

<h2 align="center">Search Blood Bank In Your City</h2>

<form class="example" action="blood.jsp" method="post">
  <input type="text" placeholder="Enter City" name="search" list="names">
<datalist id="names">
<option value="Aalo">
<option value="Abohar">
<option value="Adilabad">
<option value="Adimali">
<option value="Adoni">
<option value="Adoor">
<option value="Adukamparai">
<option value="Adyar">
<option value="Agartala">
<option value="Agra">
<option value="Ahmedabad">
<option value="Ahmednagar">
<option value="Ahwa">
<option value="Aizawl">
<option value="Ajmer">
<option value="Ajnala">
<option value="Akbarpur">
<option value="Akola">
<option value="Alappuzha">
<option value="Alathur">
<option value="Alibag">
<option value="Aligarh">
<option value="Alirajpur">
<option value="Allahabad">
<option value="Almora">
<option value="Aluva">
<option value="Alwar">
<option value="Alwaye">
<option value="Amalanagar">
<option value="Amalapuram">
<option value="Ambala">
<option value="Ambala City">
<option value="Ambasamudram">
<option value="Ambedkar Nagar">
<option value="Ambikapur">
<option value="Ambilikai">
<option value="Ambur">
<option value="Ameerpet">
<option value="Amethi">
<option value="Amravati">
<option value="Amreli">
<option value="Amritsar">
<option value="Amroha">
<option value="Anakapalli">
<option value="Anand">
<option value="Anandapur">
<option value="Anandpur Sahib">
<option value="Anantapur">
<option value="Ananthapur">
<option value="Anantnag">
<option value="Anchal">
<option value="Anekal Taluk">
<option value="Angamaly">
<option value="Angul">
<option value="Anjarakandy">
<option value="Ankola">
<option value="Ara">
<option value="Arakonam">
<option value="Arambagh">
<option value="Ariyalur">
<option value="Ariyur">
<option value="Arrah">
<option value="Aruppukottai">
<option value="Asansol">
<option value="Ashoknagar">
<option value="Atariya">
<option value="Athamallik">
<option value="Atholi">
<option value="Attur">
<option value="Aurangabad">
<option value="Auriya">
<option value="Azamgarh">
<option value="Bacheli">
<option value="Badaun">
<option value="Baddi">
<option value="Bagalkot">
<option value="Baghpat">
<option value="Bahraich">
<option value="Baikunthpur">
<option value="Bairagarh">
<option value="Balaghat">
<option value="Balangir">
<option value="Balasore">
<option value="Baliguda">
<option value="Ballabgarh">
<option value="Ballia">
<option value="Baloda">
<option value="Balrampur">
<option value="Balurghat">
<option value="Banaras">
<option value="Banaskantha">
<option value="Banda">
<option value="Banga">
<option value="Bangalore">
<option value="Banjara Hills">
<option value="Bankura">
<option value="Banswara">
<option value="Barabanki">
<option value="Baramati">
<option value="Baramulla">
<option value="Baran">
<option value="Barapali">
<option value="Barasat">
<option value="Bardhaman">
<option value="Bareilly">
<option value="Bargarh">
<option value="Baripada">
<option value="Barkatpura">
<option value="Barkui">
<option value="Barmer">
<option value="Barnala">
<option value="Barpeta">
<option value="Barrackpore">
<option value="Barut">
<option value="Barwani">
<option value="Basti">
<option value="Batala">
<option value="Bathalapalli">
<option value="Bathinda">
<option value="Beas">
<option value="Beawar">
<option value="Beed">
<option value="Begusarai">
<option value="Behror">
<option value="Belgaum">
<option value="Bellary">
<option value="Belthangady">
<option value="Bemetara">
<option value="Bengaluru">
<option value="Berhampur">
<option value="Bettiah">
<option value="Betul">
<option value="Bhadohi">
<option value="Bhadoi">
<option value="Bhadrachalam">
<option value="Bhadrak">
<option value="Bhadravathi">
<option value="Bhadravati">
<option value="Bhagalpur">
<option value="Bhagyanagar">
<option value="Bhandara">
<option value="Bhanjanagar">
<option value="Bharanganam">
<option value="Bharatpur">
<option value="Bharuch">
<option value="Bhasna">
<option value="Bhavnagar">
<option value="Bhawanipatna">
<option value="Bhilai">
<option value="Bhilwara">
<option value="Bhimavaram">
<option value="Bhind">
<option value="Bhinga">
<option value="Bhiwani">
<option value="Bhopa Road">
<option value="Bhopal">
<option value="Bhota">
<option value="Bhubaneswar">
<option value="Bhuj">
<option value="Bidar">
<option value="Bihar Sharif">
<option value="Bijapur">
<option value="Bijnor">
<option value="Bijnore">
<option value="Bikaner">
<option value="Bilaspur">
<option value="Binnaguri">
<option value="Birbhum">
<option value="Bishnupur">
<option value="Bissam Cuttack">
<option value="Biswanath chariali">
<option value="Bokaro">
<option value="Bolpur">
<option value="Bommakal">
<option value="Bongaigaon">
<option value="Boudh">
<option value="Budgam">
<option value="Bulandshahar">
<option value="Buldana">
<option value="Buldhana">
<option value="Bundi">
<option value="Burdwan">
<option value="Burdwan Sadar">
<option value="Burhanpur">
<option value="Burnpur">
<option value="Buxar">
<option value="Calicut">
<option value="Canning Town">
<option value="Chaibasa">
<option value="Chalakkudy">
<option value="Chamarajanagar">
<option value="Chamba">
<option value="Champhai">
<option value="Champua NAC">
<option value="Chandauli">
<option value="Chandausi">
<option value="Chandigarh">
<option value="Chandrapur">
<option value="Changlang">
<option value="Chapra">
<option value="Chegannur">
<option value="Chellan Nagar">
<option value="Chengalpattu">
<option value="Chengalpet">
<option value="Chengannur">
<option value="Chenganoor">
<option value="Chennai">
<option value="Cheranalloor">
<option value="Cherthala">
<option value="Cherukunnu">
<option value="Chhatarpur">
<option value="Chhatta">
<option value="Chhindwara">
<option value="Chidambaram">
<option value="Chigateri">
<option value="Chikkaballapur">
<option value="Chikkamagaluru">
<option value="Chikkodi">
<option value="Chinsurah">
<option value="Chirala">
<option value="Chiryinkil">
<option value="Chitradurga">
<option value="Chitrakoot">
<option value="Chittoor">
<option value="Chittorgarh">
<option value="Choondal">
<option value="Chrompet">
<option value="Churachandpur">
<option value="Churu">
<option value="Coimbatore">
<option value="Contai">
<option value="Cooch Behar">
<option value="Coonoor">
<option value="Cuddalore">
<option value="Cuttack">
<option value="Dabra">
<option value="Dadri">
<option value="Dahod">
<option value="Daltonganj">
<option value="Daman">
<option value="Damanjodi">
<option value="Damoh">
<option value="Danapur">
<option value="Dantewada">
<option value="Daporijo">
<option value="Darjeeling">
<option value="Dasuya">
<option value="Datia">
<option value="Dausa">
<option value="Davangere">
<option value="Dehradun">
<option value="Dehral on Sone">
<option value="Delhi">
<option value="Deogarh">
<option value="Deoria">
<option value="Devagiri">
<option value="Dewas">
<option value="Dhahan Kaleeran">
<option value="Dhaligaon">
<option value="Dhamtari">
<option value="Dhanbad">
<option value="Dhanpuri">
<option value="Dhapur">
<option value="Dhar">
<option value="Dharamshala">
<option value="Dharapuram">
<option value="Dharmagarh">
<option value="Dharmanagar">
<option value="Dharmapuri">
<option value="Dharwad">
<option value="Dhemaji">
<option value="Dhenkanal">
<option value="Dholpur">
<option value="Dhubri">
<option value="Dhule">
<option value="Diamond Harbour">
<option value="Dibrugarh">
<option value="Digboi">
<option value="Dimapur">
<option value="Dindigul">
<option value="Dindori">
<option value="Diphu">
<option value="Dishergarh Burdwan">
<option value="Dispur, Guwahati">
<option value="Diu">
<option value="DNK Malkangiri">
<option value="Doda">
<option value="Doiwala">
<option value="Domalguda">
<option value="Duliajan">
<option value="Dumka">
<option value="Dungarpur">
<option value="Durg">
<option value="Durgapur">
<option value="Edappal">
<option value="Egmore">
<option value="Eluru">
<option value="Engandiyur">
<option value="Eranhipalam">
<option value="Ernakulam">
<option value="Erode">
<option value="Etah">
<option value="Etawah">
<option value="Faizabad">
<option value="Faridabad">
<option value="Faridkot">
<option value="Farrukhabad">
<option value="Fatehabad">
<option value="Fatehgarh">
<option value="Fatehgarh Sahib">
<option value="Fatehpur">
<option value="Fazilka">
<option value="Ferozpur">
<option value="Ferozpur City">
<option value="Firozabad">
<option value="Frukhabad">
<option value="Fuleswar, Uluberia">
<option value="Gadag">
<option value="Gadchiroli">
<option value="Gadwal">
<option value="Gajapai">
<option value="Gajuwaka">
<option value="Ganderbal">
<option value="Gandhidham">
<option value="Gandhigram">
<option value="Gandhinagar">
<option value="Gangapur City">
<option value="Gangtok">
<option value="Garhwa">
<option value="Garshankar">
<option value="Gautam Budh nagar">
<option value="Gaya">
<option value="Ghailla">
<option value="Ghatal">
<option value="Ghaziabad">
<option value="Ghazipur">
<option value="Giridh">
<option value="Goalpara">
<option value="Gobichettipalayam">
<option value="Godavarikhani">
<option value="Godhara">
<option value="Godhra">
<option value="Gokak">
<option value="Golaghai town">
<option value="Golaghat">
<option value="Golconda">
<option value="Gollaguda">
<option value="Gonda">
<option value="Gondal">
<option value="Gondia">
<option value="Gopalganj">
<option value="Gopeshwar">
<option value="Gorakhpur">
<option value="Greater Noida">
<option value="Gudalur">
<option value="Gudivada">
<option value="Gudiyatham">
<option value="Gudur">
<option value="Guindy">
<option value="Gulbarga">
<option value="Gumla">
<option value="Guna">
<option value="Guntakal">
<option value="Guntur">
<option value="Guntur city">
<option value="Guntur Rural">
<option value="Gunupur">
<option value="Gurdaspur">
<option value="Gurugram">
<option value="Guwahati">
<option value="Gwalior">
<option value="Haflong">
<option value="Hailakandi">
<option value="Hajipur">
<option value="Haldia">
<option value="Haldwani">
<option value="Hamirpur">
<option value="Handwara">
<option value="Hanumakonda">
<option value="Hanumangarh">
<option value="Hapur">
<option value="Harda">
<option value="Hardoi">
<option value="Haridwar">
<option value="Hassan">
<option value="Hathras">
<option value="Haveli">
<option value="Haveri">
<option value="Hazaribagh">
<option value="Himayathnagar">
<option value="Himayatnagar">
<option value="Himmatnagar">
<option value="Hindupur">
<option value="Hingoli">
<option value="Hisar">
<option value="Hisar/Agroha">
<option value="Hojai">
<option value="Hooghly">
<option value="Hosakote">
<option value="Hoshangabad">
<option value="Hoshiarpur">
<option value="Hospet">
<option value="Hosur">
<option value="Howrah">
<option value="Hubli">
<option value="Hutti">
<option value="Hyderabad">
<option value="Hyderguda">
<option value="Hymayathnagar">
<option value="Ilkal">
<option value="Imphal">
<option value="Indore">
<option value="Islampur">
<option value="Israna">
<option value="Itanagar">
<option value="Itarsi">
<option value="Jabalpur">
<option value="Jagadhri">
<option value="Jagatsinghpur">
<option value="Jagdalpur">
<option value="Jagtial">
<option value="Jaipur">
<option value="Jaipur Road">
<option value="Jaisalmer">
<option value="Jalandhar">
<option value="Jalgaon">
<option value="Jalna">
<option value="Jalore">
<option value="Jalpaiguri">
<option value="Jamkhandi">
<option value="Jammu">
<option value="Jamnagar">
<option value="Jamshedpur">
<option value="Jamui">
<option value="Janagoan">
<option value="Jangareddygudem">
<option value="Jangipur">
<option value="Janjgir">
<option value="JASHPURNAGAR">
<option value="Jaunpur">
<option value="Jayant">
<option value="Jehanabad">
<option value="Jeypore">
<option value="Jhabua">
<option value="Jhajjhar">
<option value="Jhalawar">
<option value="Jhansi">
<option value="Jhargram">
<option value="Jharsuguda">
<option value="Jhunjhunu">
<option value="Jind">
<option value="Joda">
<option value="Jodhpur">
<option value="Jorhat">
<option value="Jowai">
<option value="Jublee Hills">
<option value="Junagadh">
<option value="Jyotiba Phule Nagar">
<option value="K. G. F.">
<option value="Kadapa">
<option value="Kadiri">
<option value="Kailashahar">
<option value="Kaithal">
<option value="Kakinada">
<option value="Kakkanad">
<option value="Kalamassery">
<option value="Kalapet">
<option value="Kalimpong">
<option value="Kalitheerthalkuppam">
<option value="Kallakurichi">
<option value="Kallor">
<option value="Kalna">
<option value="Kalpetta">
<option value="KALYANI">
<option value="Kamalpur">
<option value="Kamareddy">
<option value="Kambhat">
<option value="Kanchanbagh">
<option value="Kanchipuram">
<option value="Kandela">
<option value="KANDI">
<option value="Kangra">
<option value="Kanhangad">
<option value="Kanjirappally">
<option value="Kanker">
<option value="Kannauj">
<option value="Kannur">
<option value="Kanpur">
<option value="Kanpur Nagar">
<option value="Kanshi Ram Nagar">
<option value="Kantabanji">
<option value="Kanya Kumari">
<option value="Kanyakumari">
<option value="Kapadwanj">
<option value="Kapurthala">
<option value="Karaikal">
<option value="KaraiKudi">
<option value="Karakkonam">
<option value="Karamsad">
<option value="Karanjia">
<option value="Karauli">
<option value="Kargil">
<option value="Karimganj">
<option value="Karimnagar">
<option value="Karnal">
<option value="Karur">
<option value="Karwar">
<option value="Kasaragod">
<option value="Kashipur">
<option value="Kathua">
<option value="Katihar">
<option value="Katni">
<option value="Kattakkada">
<option value="Kattangulathur">
<option value="Kattappana">
<option value="Katwa">
<option value="Kaushambi">
<option value="Kavali">
<option value="Kawardha">
<option value="Kelambakkam">
<option value="Kendujhar">
<option value="Kengeri">
<option value="Keshod">
<option value="Khagaria">
<option value="Khaleelwadi">
<option value="Khamgaon">
<option value="Khammam">
<option value="Khandwa">
<option value="Khanna">
<option value="Kharagpur">
<option value="Kharar">
<option value="Khargone">
<option value="Khariar">
<option value="Khatra">
<option value="Khordha">
<option value="Kidangoor">
<option value="Kingkoti">
<option value="Kirandul">
<option value="KIRIBURU">
<option value="Kishanganj">
<option value="Kishangarh">
<option value="Kishtwar">
<option value="Kizhakkambalam">
<option value="Kochi">
<option value="Koderma">
<option value="Kodungallur">
<option value="Kohima">
<option value="Kokrajhar">
<option value="Kolar">
<option value="Kolasib">
<option value="Kolhapur">
<option value="KOLKATA">
<option value="Kollam">
<option value="Kollegal">
<option value="Koorkencherry">
<option value="Koothattukulam">
<option value="Koppal">
<option value="Koraput">
<option value="Korba">
<option value="Kota">
<option value="Kotdwar">
<option value="Kothagudem">
<option value="Kothamangalam">
<option value="Koti">
<option value="Kotkapura">
<option value="Kotputli">
<option value="Kottakkal">
<option value="Kottakkara">
<option value="Kottapparamba">
<option value="Kottayam">
<option value="Kottiyam">
<option value="Kovilpatti">
<option value="Kozhencherry">
<option value="Kozhikode">
<option value="Krishnagiri">
<option value="Kuchinda">
<option value="Kulgam">
<option value="Kumbakonam">
<option value="Kumbanad">
<option value="Kumta">
<option value="Kundapur">
<option value="Kunnamkulam">
<option value="Kuppam">
<option value="Kurisumudu">
<option value="Kurnool">
<option value="Kurseong">
<option value="Kuruda">
<option value="Kurukshetra">
<option value="Kushinagar">
<option value="Kutch">
<option value="Kuzhikkattusery">
<option value="Lado">
<option value="Laheriasaria">
<option value="Lakdikapool">
<option value="Lakhimpur Khiri">
<option value="Lakhisarai">
<option value="Lakshadweep">
<option value="Lalbagh">
<option value="Lalitpur">
<option value="Lamtaput">
<option value="Latehar">
<option value="Latur">
<option value="Lawngtlai">
<option value="Leh">
<option value="Lohardaga">
<option value="Lucknow">
<option value="Ludhiana">
<option value="Lumding">
<option value="Lunglei">
<option value="Machilipatnam">
<option value="Madanapalli">
<option value="Madhepura">
<option value="Madhubani">
<option value="Madikeri">
<option value="Madnapalli">
<option value="Madurai">
<option value="Madurantakam">
<option value="Maduranthagam">
<option value="Mahaboobnagar">
<option value="Mahabubnagar">
<option value="Mahad">
<option value="Maharajganj">
<option value="Mahasamund">
<option value="Mahe">
<option value="Mahoba">
<option value="Mainpuri">
<option value="Malakpet">
<option value="Malaparamba">
<option value="Malappuram">
<option value="Malda">
<option value="Malegaon">
<option value="Malerkotla">
<option value="Maligaon">
<option value="Mamit">
<option value="Manakkara">
<option value="Manathavady">
<option value="Mancherial">
<option value="Mandamarri">
<option value="Mandi">
<option value="Mandi Gobind Garh">
<option value="Mandikhera">
<option value="Mandla">
<option value="Mandsaur">
<option value="Mandya">
<option value="Mangaldoi">
<option value="Mangalore">
<option value="Mangaon">
<option value="Manipal">
<option value="Manjeri">
<option value="Mannarkad">
<option value="Mansa">
<option value="Manuguru">
<option value="Mapusa">
<option value="Maradu">
<option value="Margao">
<option value="Margherita">
<option value="Markapur">
<option value="Marrikunnu">
<option value="Mathura">
<option value="Mau">
<option value="Mavelikkara">
<option value="Maxi">
<option value="Mayiladuthurai">
<option value="Meerut">
<option value="Meeyannoor">
<option value="Meghnagar">
<option value="Mehdipatnam">
<option value="Mehsana">
<option value="Melmaruvathur">
<option value="Meppadi">
<option value="Metturdam">
<option value="Midnapore">
<option value="Miryalaguda">
<option value="Mirzapur">
<option value="Modipada">
<option value="Moga">
<option value="Mohali">
<option value="Mohan Nagar">
<option value="Mokokchung">
<option value="Mon">
<option value="Monippally">
<option value="Moovattupuzha">
<option value="Moradabad">
<option value="Morena">
<option value="Morigaon">
<option value="Motihari">
<option value="Mudhol">
<option value="Mukerian">
<option value="Mukkom">
<option value="Muktsar">
<option value="Mumbai">
<option value="Mundakayam">
<option value="Mungeli">
<option value="Munnar">
<option value="Murikkassery">
<option value="Murshidabad">
<option value="Muttuchira">
<option value="Muzaffarnagar">
<option value="Muzaffarpur">
<option value="Mylapore">
<option value="Mysore">
<option value="N/A">
<option value="Nabarangpur">
<option value="Nabha">
<option value="NADIA">
<option value="Nadiad">
<option value="Nagampadam">
<option value="Nagaon">
<option value="Nagapattinam">
<option value="Nagarcoil">
<option value="NAGAUR">
<option value="Nagda">
<option value="Nagercoil">
<option value="Nagerkoil">
<option value="Nagnur">
<option value="Nagpur">
<option value="Nahan">
<option value="Naharlagun">
<option value="Nakodar">
<option value="Nalbari">
<option value="Nalgonda">
<option value="Namakkal">
<option value="Namchi">
<option value="Nampally">
<option value="Nanded">
<option value="Nandurbar">
<option value="Nandyal">
<option value="Nangal">
<option value="Narasapuram">
<option value="Narasaraopeta">
<option value="Narayana guda">
<option value="Narayanpur">
<option value="Narketpally">
<option value="Narnaul">
<option value="Narora">
<option value="Narsinghpur">
<option value="Nashik">
<option value="Navi Mumbai">
<option value="Navsari">
<option value="Nawada">
<option value="Nawanshahar">
<option value="Nayagarh">
<option value="Neemuch">
<option value="Nelamangala">
<option value="Nellore">
<option value="Nerul">
<option value="New Delhi">
<option value="Neyoor">
<option value="Neyveli">
<option value="Neyyattinkara">
<option value="Nilagiri">
<option value="Nirmal">
<option value="Noamundi">
<option value="Noida">
<option value="North 24 Parganas">
<option value="North Kuthyathode">
<option value="North Lakhimpur">
<option value="Nuapada">
<option value="Nuh">
<option value="Oddanchataram">
<option value="Omassery">
<option value="Omerga">
<option value="Ongole">
<option value="Ooty">
<option value="Orai">
<option value="Osmanabad">
<option value="Ottapalam">
<option value="Padampur">
<option value="Padhar">
<option value="Painavu">
<option value="Pala">
<option value="Palai">
<option value="Palakkad">
<option value="Palakol">
<option value="Palampur">
<option value="Palani">
<option value="Palayamkottai">
<option value="Palghar">
<option value="Pali">
<option value="Palwal">
<option value="Panaji">
<option value="Panchkula">
<option value="Pandalam">
<option value="Panipat">
<option value="Panna">
<option value="Panvel">
<option value="Parbhani">
<option value="Pardi">
<option value="Paripally">
<option value="Pariyaram">
<option value="Parvathipuram">
<option value="Pasighat">
<option value="Patan">
<option value="Patancheru Mandal">
<option value="Pathakheda">
<option value="Pathanamthitta">
<option value="Pathanapuram">
<option value="Pathankot">
<option value="Patiala">
<option value="Patna">
<option value="Patnagarh">
<option value="Patti">
<option value="Pattukkottai">
<option value="Pattukottai">
<option value="Pauri Garhwal">
<option value="Payyannur">
<option value="Perambalur">
<option value="Peringandoor">
<option value="Perintalmanna">
<option value="Perinthalmanna">
<option value="Perinthanmanna">
<option value="Periyakulam">
<option value="Perumbavoor">
<option value="Petlaburj">
<option value="Petlad">
<option value="Phagwara">
<option value="Phek">
<option value="Phillaur">
<option value="Phulbani">
<option value="Piduguralla">
<option value="Pilibhit">
<option value="Pilkhuwa">
<option value="Pillayarkuppam">
<option value="Pithoragarh">
<option value="Pollachi">
<option value="Pondicherry">
<option value="Porbandar">
<option value="Porompat">
<option value="Port blair">
<option value="Pratapgarh">
<option value="PRODDATUR">
<option value="Puducherry">
<option value="Pudukkottai">
<option value="Pulivendula">
<option value="Pullazhi">
<option value="Pullur">
<option value="Pulwama">
<option value="Punalur">
<option value="Pune">
<option value="Punkunnam">
<option value="Puri">
<option value="Purnia">
<option value="Purulia">
<option value="Putlibowli">
<option value="Puttaparthy">
<option value="Puttur">
<option value="Quthbullapur">
<option value="R.K puram">
<option value="Raebareli">
<option value="Ragolu">
<option value="Raichur">
<option value="Raigad">
<option value="Raigarh">
<option value="Raipur">
<option value="Rairakhol">
<option value="Rairangpur">
<option value="Raisen">
<option value="Rajahmundry">
<option value="Rajam">
<option value="Rajapalayam">
<option value="Rajendra Nagar Mandal">
<option value="Rajgarh">
<option value="Rajkot">
<option value="Rajnandgaon">
<option value="Rajouri">
<option value="Rajpura Town">
<option value="Rajsamand">
<option value="Ramachandrapuram">
<option value="Ramanagar">
<option value="Ramanathapuram">
<option value="Ramavarmapuram">
<option value="Ramban">
<option value="Ramgarh">
<option value="Rampur">
<option value="Rampura Phul">
<option value="Ranchi">
<option value="Ranga Reddy">
<option value="Raniganj">
<option value="Ranikhet">
<option value="Ranni">
<option value="Rasipuram">
<option value="Ratangarh">
<option value="Ratlam">
<option value="Ratnagiri">
<option value="Rawatbhata">
<option value="Raxaul">
<option value="Rayagada">
<option value="Reckong Peo">
<option value="Red Hills">
<option value="Renukoot">
<option value="Repalle">
<option value="Rewa">
<option value="Rewari">
<option value="Rishikesh">
<option value="Rohru">
<option value="Rohtak">
<option value="Rohtas">
<option value="Roorkee">
<option value="Rourkela">
<option value="Rudrapur">
<option value="Rupnagar">
<option value="Sabarkantha">
<option value="Sagar">
<option value="Saharanpur">
<option value="Saharsa">
<option value="Sahebganj">
<option value="Saiha">
<option value="Salem">
<option value="Samastipur">
<option value="Samba">
<option value="Sambalpur">
<option value="Sambhal">
<option value="Samrala">
<option value="Sanathnagar">
<option value="Sangareddy">
<option value="Sangivalasa">
<option value="Sangli">
<option value="Sangrur">
<option value="Sankarankovil">
<option value="Sant Kabir Nagar">
<option value="SAS Nagar">
<option value="Sasaram">
<option value="Satara">
<option value="Satna">
<option value="Sattupally">
<option value="Satwari">
<option value="Sawai Madhopur">
<option value="Secunderabad">
<option value="Sehore">
<option value="Seoni">
<option value="Serampore">
<option value="Serchhip">
<option value="Serilingampally">
<option value="Serkawn">
<option value="Shah Ali Banda">
<option value="Shahdol">
<option value="Shahjahanpur">
<option value="Shahjhanpur">
<option value="Shajapur">
<option value="Shamli">
<option value="Sheikhpura">
<option value="SHEOPUR">
<option value="Shillong">
<option value="Shimla">
<option value="Shimoga">
<option value="Shivamogga">
<option value="Shivpuri">
<option value="Shopian">
<option value="Siddhpur">
<option value="Siddipet">
<option value="Sidhara">
<option value="Sidharth Nagar">
<option value="Sidhi">
<option value="Sikar">
<option value="Silchar">
<option value="Siliguri">
<option value="Silvassa">
<option value="Simdega">
<option value="Sindhanur">
<option value="Sindhudurga">
<option value="Singrauli">
<option value="Sirohi">
<option value="Sirsa">
<option value="Sirsi">
<option value="Siruvachur">
<option value="Sitamarhi">
<option value="Sitapur">
<option value="Sivagangai">
<option value="Sivakasi">
<option value="Sivasagar">
<option value="Siwan">
<option value="Sojat City">
<option value="Solan">
<option value="Solapur">
<option value="Somajiguda">
<option value="Sonbhadra">
<option value="Sonepur">
<option value="Sonipat">
<option value="South 24 Parganas">
<option value="Sriganganagar">
<option value="Srikakulam">
<option value="Srinagar">
<option value="Sringeri">
<option value="Srisailam Project">
<option value="Subhash Nagar">
<option value="Sujangarh">
<option value="Sukma">
<option value="Sullia">
<option value="Sultanpur">
<option value="Sulthan Bathery">
<option value="Sumerpur">
<option value="Sunabeda">
<option value="Sundargarh">
<option value="Sundergarh">
<option value="Surajpur">
<option value="Surat">
<option value="Surendranagar">
<option value="Suri">
<option value="Suryapet">
</datalist>
  <button type="submit" onchange="this.form.submit()"><i class="fa fa-search"></i></button>
</form>
<br>
</div>

<%
try
{   int count=1;
	db d=new db();
	Connection con=d.getConnection();
	Statement stm=con.createStatement();
	ResultSet rs=stm.executeQuery("select * from blood where lower(city) like '%"+request.getParameter("search")+"%' or upper(city) like '%"+request.getParameter("search")+"%' or concat(upper(substring(city,1,1)),lower(substring(city,2))) like '%"+request.getParameter("search")+"%'");
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
       <td><%= rs.getString("Contact_no") %></td>
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