<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:import url="../layout/header.jsp" />
    
    	<script type="text/javascript">
window.onload = function () {
	
("use strict");

const form = document.querySelector("#form__wrap");
const checkAll = document.querySelector(".terms__check__all input");
const checkBoxes = document.querySelectorAll(".input__check input");
const submitButton = document.querySelector("button");

const agreements = {
  termsOfService: false,
  privacyPolicy: false,
  allowPromotions: false
};

//submit 버튼 작동 안되게 하는 놈...
//form.addEventListener("submit", (e) => e.preventDefault());

//얘가 없으면 모든 checkbox 만 선택되서 확인 버튼 나옴 있어야됨
checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle("active");
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener("click", (e) => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add("active");
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove("active");
    });
  }
  toggleSubmitButton();
	});
}
</script>


<style type="text/css">
* {
	box-sizing: border-box;
}



ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.wrap {
	margin: auto;
}


.wrap .contents {
	padding: 120px;
	background-color: #ffffff;
	border: 1px solid #dadada;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
}

#form__wrap {
	margin: 0 auto;
	width: 460px;
	font-size: 14px;
}

#form__wrap .terms__check__all {
	display: flex;
	margin-bottom: 35px;
}

#form__wrap .terms__check__all label {
	margin-left: 3px;
	text-decoration: underline;
}

.terms__list .terms__box {
	margin: 20px 0;
}

.contents label {
	font-weight: 700;
}

label.required::after {
	margin-left: 4px;
	font-size: 13px;
	font-weight: 400;
	line-height: 24px;
	color: #0086ff;
	content: "(필수)";
}

.terms__list .terms__content {
	height: 88px;
	overflow: auto;
	margin-top: 8px;
	padding: 12px;
	border: 1px solid #dadada;
	background: #fff;
	font-size: 12px;
}

.next-button {
	width: 100%;
	height: 40px;
	outline: none;
	cursor: pointer;
	background-color: #242222;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	transition-duration: 0.2s;
}

.next-button:hover:enabled {
	background-color: #a3a2a2;
}

.next-button:disabled {
	opacity: 0.2;
	cursor: not-allowed;
}

@media ( max-width : 768px) {
	.wrap {
		min-width: 280px;
		padding: 20px;
	}
	#form__wrap {
		max-width: 460px;
		width: auto;
	}
}
</style>

	<div class="wrap">
		<div class="contents">
			<form action="/member/join" method="get" id="form__wrap">
			
				<div class="terms__check__all">
					<input type="checkbox" name="checkAll" id="checkAll"/> 
					<label for="checkAll">
						솜이네둥이네 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신<br>
						(선택)에 모두 동의합니다.
					</label>
				</div>
				
				<ul class="terms__list">
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="termsOfService"
								value="termsOfService" required /> 
								<label for="termsOfService" class="required">
								솜이네둥이네 이용약관 동의
								</label>
						</div>
						<div class="terms__content">
						솜이네 둥이네 에서는 사실만을 작성해야 하며 거짓 및 잘못된 글로 인해 
						피해가 생기면 그에 따른 소송을 제기할 수 있습니다.
						</div>
					</li>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="privacyPolicy"
								value="privacyPolicy" required /> <label
								for="privacyPolicy" class="required">개인정보
								수집 및 이용 동의</label>
						</div>
						<div class="terms__content">
						개인정보는 3년간 유지되며 오로지 솜이네 둥이네를 위해서만 사용됩니다.
						</div>
					</li>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="allowPromotions"
								value="allowPromotions" /> <label
								for="allowPromotions">프로모션 정보 수신 동의</label>
						</div>
						<div class="terms__content">
						이벤트, 정보 등을 문자나 이메일로 보내드립니다.
						</div>
					</li>
				</ul>
				<button type="submit" class="next-button" disabled>확인</button>
			</form>
		</div>
	</div>
    

   
   
   
   
   
   
   
   
  
    
    <c:import url="../layout/footer.jsp" />

