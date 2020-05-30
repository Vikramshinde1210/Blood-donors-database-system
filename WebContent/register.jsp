<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="wentWrong.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<title>Register</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
  box-sizing: border-box;
}
input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

input[type=tel], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}



input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

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
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: center;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}
.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
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
<button type="button" class="collapsible">Blood Donation Facts</button>
<div class="content">
  <p><strong> Blood Donation Facts </strong>
                                    
                                        <table id="Table1" cellspacing="0" cellpadding="5">
                                          <tr>
                                            <td valign="top"><p class="heading_color">Facts about blood needs</p>
                                              <ul>
                                                <li>Every year our nation requires about <strong>5 Crore 
                                                units</strong> of blood, out of which only a meager <strong>2.5 Crore units</strong> of blood are available.</li>
                                                <li>The <strong>gift of blood</strong> is the <strong>gift 
                                                  of life</strong>. There is no substitute for human 
                                                blood.
                                                
                                                                                          <li>Every two seconds someone  needs blood.</li>
                                                <li>More than 38,000 blood donations are needed every day.</li>
                                                <li>A total&nbsp;of 30 million blood components are transfused each year.</li>
                                                <li>The average red blood cell transfusion is approximately 3 pints.</li>
                                                <li>The blood type most often requested by hospitals is Type O.</li>
                                                <li>Sickle cell patients can require  frequent blood transfusions throughout their lives.</li>
                                                <li>More than 1 million new people are diagnosed with cancer each year.  Many of them will need blood, sometimes daily, during their  chemotherapy treatment.</li>
                                                <li>A single car accident victim can require as many as 100 units of blood</li>
                                              </ul>
                                              <p class="heading_color">Facts about the blood supply</p>
                                              <ul>
                                                <li>Blood cannot be manufactured &ndash; it can only come from generous donors./li>
                                                <li>Type O-negative blood (red cells) can be transfused to patients of  all blood types. It is always in great demand and often in short supply.</li>
                                                <li>Type AB-positive plasma can be transfused to patients of all other blood types. AB plasma is also usually in short supply.</li>
                                              </ul>
                                              <p class="heading_color">Facts about the blood donation process</p>
                                              <ul>
                                                <li>Donating blood is a safe process. A sterile needle is used only once for each donor and then discarded.</li>
                                                <li>Blood donation is a simple four-step process: registration, medical history&nbsp;and&nbsp;mini-physical, donation and refreshments.</li>
                                                <li>Every blood donor is given a mini-physical, checking the donor's  temperature, blood pressure, pulse and&nbsp;hemoglobin to ensure it is safe  for the donor to give blood.</li>
                                                <li>The actual blood donation typically takes less than 10-12 minutes.  The entire process, from the time you arrive to the time you leave,  takes about an hour and 15 min.</li>
                                                <li>The average adult has about 10 units of blood in his body. Roughly 1 unit is given during a donation.</li>
                                                <li>A healthy donor may donate red blood cells every 56 days, or double red cells every 112 days.</li>
                                                <li>A healthy donor may donate platelets as few as&nbsp;7 days apart, but a maximum of 24 times a year.</li>
                                                <li>All donated blood is tested for HIV, hepatitis B and C, syphilis  and other infectious diseases before it can be transfused to patients.</li>
                                              </ul>
                                              <span class="heading_color">Facts about blood and its components                                              </span>
                                              <ul>
                                                <li>Blood makes up about 7 percent of your body's weight.</li>
                                                <li>There are four types of transfusable products that can be derived  from blood: red cells, platelets, plasma and cryoprecipitate.  Typically,&nbsp;two or three of these are produced from a unit of donated  whole blood &ndash; hence each donation can help save up to three lives.
                                                /></li>
                                                <li>Donors can give either whole blood or specific blood components  only. The process of donating specific blood components &ndash; red cells,  plasma or platelets &ndash; is called apheresis.</li>
                                                <li>One transfusion dose of platelets can be obtained through one  apheresis donation of platelets or by combining the platelets derived  from&nbsp;five whole blood donations.</li>
                                                <li>Donated platelets must be used within&nbsp;five days of collection.</li>
                                                <li>Healthy bone marrow makes a constant supply of red cells, plasma  and platelets. The body will replenish the elements given during a  blood donation &ndash; some in a matter of hours and others in a matter of  weeks.</li>
                                              </ul>
                                              <p class="heading_color">Facts about donors</p>
                                              <ul>
                                                <li>The&nbsp;number one&nbsp;reason donors say they give blood is because they &quot;want to help others.&quot;</li>
                                                <li>Two most common reasons cited by people who don't give blood are: &quot;Never thought about it&quot; and &quot;I don't like needles.&quot;</li>
                                                <li>One donation can help save the lives of up to&nbsp;three people.</li>
                                                <li>If you began donating blood at age 18 and donated every 90 days  until you reached 60, you would have donated 30 gallons of blood,  potentially helping save more than 500 lives!</li>
                                                <li>Only 7 percent&nbsp;of people in India have O-negative blood  type.&nbsp;O-negative blood type donors are universal donors as their blood  can be given to people of all blood types.</li>
                                                <li>Type O-negative blood is needed in emergencies before the patient's blood type is known and with newborns who need blood.</li>
                                                <li>Thirty-five percent&nbsp;of people  have Type O (positive or  negative) blood. </li>
                                                <li>0.4 percent of people  have AB-blood type.  AB-type blood donors are universal donors of plasma, which is  often used in emergencies, for newborns and for patients requiring  massive transfusions.</li>
                                              </ul>
                                              <p>There are four main blood types: <strong>A, B, AB and O.</strong></p>
                                              <p>In 1901, Karl Landsteiner, an Austrian physician, discovers the first three human blood groups. On his birthday i.e June 14th &quot;World Blood Donors Day&quot; celebrates. On October 1st &lsquo;National Blood Donation Day&rsquo; celebrates in India.</p>
                                              <p><strong>WHAT TYPE ARE YOU?</strong> </p>
                                              <table width="80%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FF0000">
                                                  <tr bgcolor="#FFFFFF">
                                                    <td colspan="2"><div align="center"><strong>FREQUENCY 
                                                      OF BLOOD TYPES</strong></div></td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>O+ 1 person in 3</td>
                                                    <td>O- 1 person in 15</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>A+ 1 person in 3</td>
                                                    <td>A- 1 person in 16</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>B+ 1 person in 12</td>
                                                    <td>B- 1 person in 67</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>AB+ 1 person in 29</td>
                                                    <td>AB- 1 person in 167</td>
                                                  </tr>
                                                </table>
                                              <br />
                                              <table width="80%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FF0000">
                                                  <tr bgcolor="#FFFFFF">
                                                    <td colspan="2"><div align="center"><strong>EXAMPLES 
                                                      OF BLOOD USE </strong></div></td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>1. Automobile Accident</td>
                                                    <td>50 units of blood</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>2. Heart Surgery</td>
                                                    <td>6 units of blood / 6 units of platelets</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>3. Organ Transplant</td>
                                                    <td>40 units of blood / 30 units of platelets</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>4. 20 bags of cryoprecipitate</td>
                                                    <td>25 units of fresh frozen plasma</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>5. Bone Marrow Transplant</td>
                                                    <td>120 units of platelets/ 20 units of blood</td>
                                                  </tr>
                                                  <tr bgcolor="#FFFFFF">
                                                    <td>6. Burn Victims</td>
                                                    <td>20 units of platelets</td>
                                                  </tr>
                                              </table></td>
                                          </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td height="9"></td>
                                  </tr>
                                </table></td>
				</tr>
						</table>
</div>
<button type="button" class="collapsible">Who can/can't donate blood</button>
<div class="content">
  <p><p class="heading_color">Can...</p><p><strong>Let others benefit from your 
                            good health. Do donate blood if ...</strong> </p>
                          <ul>
                            <li>you are between age group of 18-60 years.<br>
                            </li>
                            <li>your weight is 45 kgs or more.<br>
                            </li>
                            <li>your haemoglobin is 12.5 gm% minimum.<br>
                            </li>
                            <li>your last blood donation was 3 months earlier.<br>
                            </li>
                            <li>you are healthy and have not suffered from malaria, 
                              typhoid or other transmissible disease in the recent 
                              past. </li>
                          </ul>
                          <p>There are many, many people who meet these parameters 
                            of health and fitness! </p>
                          <p><strong>Do abide by our rules - be truthful about 
                            your health status!</strong></p>
                          <p>We ensure the health of blood, before we take it, 
                            as well as after it is collected. Firstly, the donor 
                            is expected to be honest about his or her health history 
                            and current condition. Secondly, collected blood is 
                            tested for venereal diseases, hepatitis B &amp; C 
                            and AIDS. </p>
                          <p>You have to be healthy to give 'safe blood' </p>
                          <p><span class="heading_color">Can't...</span></p>
                          <p><strong>Do not donate blood if you have any of these 
                            conditions</strong></p>
                          <ul>
                            <li>cold / fever in the past 1 week.<br>
                            </li>
                            <li>under treatment with antibiotics or any other 
                              medication.<br>
                            </li>
                            <li>cardiac problems, hypertension, epilepsy, diabetes 
                              (on insulin therapy), history of cancer,chronic 
                              kidney or liver disease, bleeding tendencies, venereal 
                              disease etc. <br>
                            </li>
                            <li>major surgery in the last 6 months.<br>
                            </li>
                            <li>vaccination in the last 24 hours.<br>
                            </li>
                            <li>had a miscarriage in the last 6 months or have 
                              been pregnant / lactating in the last one year. 
                              <br>
                            </li>
                            <li>had fainting attacks during last donation.<br>
                            </li>
                            <li>have regularly received treatment with blood products.<br>
                            </li>
                            <li>shared a needle to inject drugs/ have history 
                              of drug addiction. <br>
                            </li>
                            <li>had sexual relations with different partners or 
                              with a high risk individual.<br>
                            </li>
                            <li>been tested positive for antibodies to HIV. </li>
                          </ul>
                          <p><strong>Pregnancy And Menstrual Cycle</strong></p>
                          <ul>
                            <li>Females should not donate blood during pregnancy.<br>
                            </li>
                            <li>They can donate after 6 months following a normal 
                              delivery and when they are not breast feeding. <br>
                            </li>
                            <li>Females should not donate blood if they are having 
                              heavy menstrual flow or menstrual cramps. </li>
                          </ul></p>
</div>



<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>


<div class="container">
  <form action="connection.jsp">
  <div class="row">
    <div class="col-25">
      <label for="fname">Full Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="fname" name="fname" placeholder="Your name.." required>
    </div>
  </div>
  
  <div class="row">
    <div class="col-25">
      <label for="blood">Blood Group</label>
    </div>
    <div class="col-75">
     
    <select  id="blood" name="blood" required>
    <option value="">None</option>
	<option value="A+">A+</option>
	<option value="A-">A-</option>
	<option value="A1+">A1+</option>
	<option value="A1-">A1-</option>
	<option value="A1B+">A1B+</option>
	<option value="A1B-">A1B-</option>
	<option value="A2+">A2+</option>
	<option value="A2-">A2-</option>
	<option value="A2B+">A2B+</option>
	<option value="A2B-">A2B-</option>
	<option value="AB+">AB+</option>
	<option value="AB-">AB-</option>
	<option value="B+">B+</option>
	<option value="B-">B-</option>
	<option value="O+">O+</option>
	<option value="O-">O-</option>
      </select>
    </div>
  </div>
  
   <div class="row">
    <div class="col-25">
      <label for="con">Select Country</label>
    </div>
    <div class="col-75">
<select name="country" class="countries order-alpha presel-IN" id="countryId" required>
    <option value="">Select Country</option>
</select>
        </div>
  </div>
 <div class="row">
    <div class="col-25">
      <label for="state">Select State</label>
    </div>
    <div class="col-75">
<select name="state" class="states order-alpha" id="stateId" required>
    <option value="">Select State</option>
</select>
        </div>
  </div>
<div class="row">
    <div class="col-25">
      <label for="city">Select City</label>
    </div>
    <div class="col-75">
<select name="city" class="cities order-alpha limit-pop-100000" id="cityId" required>
    <option value="">Select City</option>
</select>
        </div>
  </div>

<div class="row">
    <div class="col-25">
      <label for="date">Last Blood Donation Date</label>
    </div>
    <div class="col-75">
<input type="text" name="date" placeholder="YYYY-MM-DD or NA if not applicable" required title="Enter a date in this format YYYY-MM-DD"/>
        </div>
  </div>
<div class="row">
    <div class="col-25">
      <label for="mob">Mobile Number</label>
    </div>
    <div class="col-75">
      <input type="tel" id="mob" name="mob" placeholder="Enter 10 Digit Mobile Number" pattern="[0-9]{10}" required>
    </div>
  </div>

   <div class="row">
    <div class="col-25">
      <label for="user">User Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="user" name="user" placeholder="Enter User Name.." required>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="pass">Password</label>
    </div>
    <div class="col-75">
      <input type="password" id="pass" name="pass" placeholder="Enter Password.." required>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="repass">Re-type Password</label>
    </div>
    <div class="col-75">
      <input type="password" id="repass" name="repass" placeholder="Re-type Above Password.." required>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
     
    </div>
    <div class="col-75">
      <p><input type="checkbox" name="terms" required> I authorise the website to display my name and telephone number, so that the needy could contact me, as and when there is an emergency.</p>
    </div>
  </div>
  <div class="row">
  <div class="col-25">
    <br>
    </div>
    
    <div class="col-75">
      
    </div>
  </div>
  <div class="row">
    <input type="submit" value="Submit" onclick="return Validate(this)">
  </div>
  </form>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src="//geodata.solutions/includes/countrystatecity.js"></script>
<script type="text/javascript">
    function Validate(form) {
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("repass").value;
        if (password == confirmPassword) {
            return true;
            
         }
        alert("Please fill all the fields and check password again")
      return false;
    }
</script>
<footer class="w3-container w3-padding-32 w3-light-grey w3-center">
  <p>&copy; 2020 lifesaver.azurewebsites.net<p>
  <a href="#" class="w3-button w3-black w3-margin"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  </footer>
</body>
</html>
