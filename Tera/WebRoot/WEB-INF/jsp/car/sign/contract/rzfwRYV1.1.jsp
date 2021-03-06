<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/sys/include.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>标准化融资服务协议v1.1</title>

<style type="text/css">
p {
	line-height:29px;		
}
</style>

</head>

<body>
<div align="left" style="position: relative; left:-260px; float: right;">	
	<p style="text-align:center;font-size:24px;"><strong>融资服务协议 </strong></p>
</div>
 
<div style="clear:both"></div>
<p style="text-align:right;">
    编号：<u>    ${contract.contractNo}-01      </u></p>
<p>本协议由以下三方于<u> ${year}   </u>年<u> ${month}  </u>月<u> ${date}  </u>日在<u>   ${contract.signProvince}    ${contract.signCity}   ${contract.signCounty}  </u>   签署： <br />
  <strong>甲方（借款人）： </strong><u>              ${bean.name}              </u> <br />
  身份证号码：<u>              ${bean.idNo}              </u><br />
   住所：<u>  ${bean.addProvince} ${bean.addCity} ${bean.addCounty} ${bean.address}  </u><br />
  联系方式：<u>               ${bean.mobile}                 </u><br />
  <strong>乙方：<u>                 ${companyName}                </u> </strong><br />
  住所：<u>                北京市朝阳区永安东路16号CBD国际大厦611                </u><br />
  邮编：<u>                100022                </u> <br />
  联系方式：<u>                010-85219879                </u><br />
    <strong>丙方：<u>                中海微银资产管理有限公司                </u> </strong><br />
  住所：<u>                北京市东城区东长安街1号东方广场C1办公楼302-303                </u><br />
  邮编：<u>                100005                </u><br />
  联系方式：<u>                400-669-2288                </u></p> 


<p align="left"><strong>鉴于： </strong><br />
  1.甲方有借款需求； <br />
  2.乙方为甲方提供借款信息咨询，对甲方的资信状况进行综合评估，推荐甲方在丙方平台向出借人发起借款请求以满足资金需求，并提供贷后管理等居间服务； <br />
  3.丙方为<u>中海微银资产管理有限公司</u>平台（互联网域名为<u>   www.zhonghaiweiyin.com   </u>）的运营管理人，提供金融信息咨询、交易撮合及信息技术支持等相关居间服务。 <br />
  甲方同意接受乙方、丙方共同提供的融资相关服务并与乙、丙两方达成如下一致意见：</p>
 
  <p align="left"><strong>第一条 定义与释义 </strong><br />
  在本协议中，下列词语具有以下含义：<br />
  借款人：指在丙方平台注册，由乙方、丙方共同促成的、与出借人签署相关资金借款协议，从而得到出借人的出借款项且具有完全民事权利/行为能力的中华人民共和国（以下简称“中国”，为避免疑义，不包括中国香港、澳门及台湾地区）境内自然人、法人或其它组织。<br />

	出借人：指在丙方平台注册，并通过丙方平台以自有资金实现出借且具有完全民事权利/行为能力的中国境内自然人、法人或其它组织；或者通过受让在丙方平台注册的其他出借人的既有债权而对借款人享有相应债权的具有完全民事权利/行为能力的中国境内自然人、法人或其它组织。<br />
	借款人基本信息：指借款人提供的姓名/单位名称、身份证件号码/营业执照号码、组织机构代码证、住址/住所地/营业地等基本信息，其范围应以丙方平台规则为准。<br />
	借款人信用信息：指乙方、丙方自行收集以及通过第三方合作机构获得的借款人的除借款人基本信息之外的其他信息，如借款人的工作情况、收入情况、家庭情况、信用报告、历史偿债情况等。<br />
	借款人信息：指借款人基本信息、借款人信用信息以及乙方、丙方根据该等信息对借款人做出的信用评级的合称。<br />
	借款人信用评级：指乙方、丙方根据借款人信息及内部评级规则对甲方进行的信用评级。<br />
	借款协议：指经乙方、丙方提供服务从而促成的由借款人与出借人及乙方、丙方共同以电子合同的形式订立的，约定由出借人向借款人提供一定数额的出借款项并由借款人在约定还款日还本付息的协议。<br />
	提前还款：指借款协议中约定了甲方的本息偿还周期和金额等计划，甲方可能在协议规定的周期结束前，在某一期将剩余本金全部提前支付给出借人，从而使出借人的本金比约定的计划提前收回。<br /></p>



  <p align="left"><strong>第二条 甲方融资事项 </strong><br />
2.1 甲方有意愿经由乙方的推荐在丙方平台发起借款，拟借款金额为人民币：【<u>     ￥<fmt:formatNumber value="${contract.loanAmount}" pattern="#,#00.00"/>     </u>】元（大写：【
<u>     ${loanAmount}     </u>】元整）。
即甲方同意丙方将本条约定的甲方拟借款金额作为一个甲方借款需求（“借款标”）
发布在丙方平台上进行展示并从出借人（丙方注册用户，出借人信息详见借款文件，本协议中“借款文件”指甲方签署的《借款声明书》及在丙方平台与出借人达成的在线《借款协议》，下同）处获得借款。<br />
2.2 甲方借款期限：<br />
借款合同期限：【<u> ${decision.period } </u> 】个月，具体以借款文件约定为准。<br />
2.3 甲方借款用途：【<u> ${bean.useage1}  ${bean.useage2}   </u>】。<br />

2.4 甲方利率及偿还本金安排：具体以借款文件约定为准。<br />
2.5 甲方借款其他事项：具体以借款文件约定为准。<br /></p>

<p align="left"><strong>第三条 甲方的权利与义务</strong><br />
3.1 甲方在借款过程中，必须按乙方要求如实提供真实有效的个人信息和记载该信息的证件文本。<br/>
3.2 甲方同意乙方或乙方的合作机构在甲方未按时履行还款义务时，使用甲方提供的信息提醒或督促甲方履行还款义务。<br/>
3.3 甲方应履行借款文件约定的还款义务，如甲方接到出借人或其代理人发出的债权转让通知，甲方应继续向债权受让人履行借款文件的还款义务。<br/>
3.4 如甲方需提前还款，应提前3个工作日向乙方提出书面申请（还款日当日及节假日期间不受理），通过乙方与出借人协商提前还款时间。甲方应在约定的时间前将相应款项存入指定还款账户。<br/>
3.5 甲方应按照本协议的规定向乙方、丙方支付服务费。<br/>
3.6 依据借款文件及本协议约定，甲方同意乙方委托的支付机构从甲方指定账户中划扣应偿还或支付的款项。如果实际划扣款项超过借款文件或本协议约定的金额，甲方有权要求乙方将超过部分退还给甲方。<br/>
3.7 甲方同意，如甲方在履行借款文件的过程中存在违约情形，乙方可将甲方不良信息予以公开披露或向征信机构提供。<br/>
3.8 甲方理解并接受乙方促成交易过程中可能将其信息提供给多个出借人，而获取甲方个人信息的出借人可能拒绝出借。<br/>
3.9 甲方须确保借款文件中的指定收款账户为甲方本人名下合法有效的银行账户。</p>

<p align="left"><strong>第四条 乙方的权利与义务</strong><br />
4.1 乙方须为甲方提供借款方案和全程信息咨询服务，并在甲方申请借款服务过程中协助其办理各项手续。<br />
4.2 对于甲方在接受服务时向乙方提供的个人资料及其他各类信息，乙方应依法为甲方保密。<br />
4.3 乙方应根据甲方的信用状况提出借款方案，决定是否将甲方的全部或部分借款需求向丙方及出借人推荐，以协助达成交易。<br />
4.4 乙方依据本协议约定向甲方收取服务费。<br />
4.5 乙方应妥善保管甲方在借款交易过程中签署的法律文件。<br /></p>

<p align="left"><strong>第五条 丙方的权利与义务</strong><br />
5.1 在丙方平台上发布经乙方推荐的甲方借款需求。<br />
5.2 丙方依据借款文件及本协议的约定向甲方、乙方、出借人等提供居间服务。<br />
5.3 丙方依据本协议约定向甲方收取服务费。<br />
5.4 为实现甲方的交易目的，丙方应提供相关技术支持与服务的义务。丙方技术支持与服务内容如下：<br />
5.4.1 完成项目信息整理及规范化；<br />
5.4.2 负责维护交易系统及网络环境的稳定且良好运行，以保证融资项目相关信息顺利发布；<br />
5.4.3 保证交易系统的连续性和可靠性，保证交易数据记录的准确性。<br /></p>

<p align="left"><strong>第六条 服务费及支付方式</strong><br />
6.1 甲方应付服务费金额如下：<br />
甲方应向乙方支付服务费人民币（大写） <u>     ${serviceSumAmountUpperCase}     </u>元，小写<u>     ￥<fmt:formatNumber value="${serviceSumAmountLowerCase}" pattern="#,#00.00"/>     </u>；<br />
甲方应向丙方支付服务费人民币（大写）<u>     ${jiaToBingjeUpperCase }     </u>元，小写 <u>     ￥<fmt:formatNumber value="${jiaToBingjeLowerCase}" pattern="#,#00.00"/>     </u>。<br />
6.2 甲方同意，所有服务费在甲方取得借款前一次性付清，由丙方从出借人提供给甲方的借款中直接划转相当于甲方应支付给乙方、丙方的服务费的金额至乙方、丙方指定账户。<br />
6.3 无论何种原因，乙方、丙方已收取的服务费不予退还。<br /></p>

<p align="left"><strong>第七条 甲方指定账户的变更</strong><br />
7.1 甲方须确保借款文件中指定收款账户和还款账户为甲方本人名下合法有效的银行账户。如甲方需要变更指定还款账户，需在还款日前至少5个工作日向乙方提出申请，并签署《借款人客户信息变更书》，否则甲方需承担因此而产生的未及时还款的违约责任。<br />
7.2 在还款过程中，甲方有义务配合乙方为保证还款而进行的包括但不限于账户验证、账户变更、身份证验证等事项，因甲方不配合而造成的未能正常还款的违约责任，概由甲方承担。<br /></p>

<p align="left"><strong>第八条 委托授权条款</strong><br />
为妥善完成服务事项，顺利取得出借款项，甲方特此委托并授权：<br />
8.1 委托并授权乙方向丙方披露甲方与借款行为相关的全部信息，包括但不限于姓名、身份证明、通讯地址、征信情况、资产状况、涉诉情况等，并同意丙方将该等信息展示。<br />
8.2 委托并授权丙方代理其办理与借款相关的在丙方平台展示及签约、开户、借款、提现、还款、解约等事项。<br />
8.3 委托并授权丙方从出借人提供的借款中收取本协议第六条约定的相关费用，并代为将上述费用交付相应的收费方。<br />
8.4 委托并授权乙方自甲方指定银行账户划转还款资金至出借人指定账户，乙方的划转交付行为即视为甲方对出借人履行相应的还款义务，直至甲方的债务全部清偿完毕。<br /></p>

<p align="left"><strong>第九条 违约责任</strong><br />
9.1 甲方未按照约定于还款日当日18:00前将应还款金额足额存入指定还款账户的视为逾期，甲方逾期应向乙方支付逾期违约金及罚息，逾期违约金及罚息计算规则如下：<br />
9.1.1 逾期违约金：当月应还本息的10%，计算金额不足人民币100元的按照100元计，多期还款逾期情形下，针对每期逾期应独立计算逾期违约金，甲方应付逾期违约金为各期独立计算的逾期违约金金额之和；<br />
9.1.2 罚息：每日按照借款金额的0.05%收取罚息；多期还款逾期情形下，针对每期逾期应独立计算罚息，甲方应付罚息为各期独立计算的罚息金额之和；<br />
9.1.3 如因甲方原因导致未能结清当期全部欠款，则按照以上条款执行；<br />
9.1.4 若甲方偿还金额不足，偿还先后顺序为催收费用、罚息、逾期违约金、应还利息、应还本金。<br />
9.2 任何一方违反本协议的约定，导致本协议的全部或部分不能履行，均应承担违约责任，并赔偿守约方因此遭受的损失；如甲、乙、丙三方均违约，根据实际情况各自承担相应的责任。<br />
9.3 甲方在借款过程中提供的个人身份信息、联系方式、单据、介绍信、印章或者其他证明文件应保证真实、合法、有效，如有隐瞒欺诈、虚假不实，乙方有权解除本协议，追回欠款，并向司法机关报案。<br />
9.4 因甲方未按借款文件约定及时还款而导致乙方发生的催收费用，包括但不限于调查费用、诉讼仲裁费用、律师费用及差旅费用等，概由甲方承担。甲方仍应按借款文件约定支付逾期利息、承担违约责任。<br />
9.5 甲方累计逾期达15天以上的，或累计发生三次逾期的情况下，甲方同意：乙方有权宣布甲方债务即时提前到期，并要求甲方一次性清偿全部剩余本息并按本协议第九条约定承担相应违约责任。<br /></p>

<p align="left"><strong>第十条 变更通知</strong><br />
10.1 本协议签订之日起至借款全部清偿之日止，甲方有义务在下列信息变更之日起3日内提供更新后的信息给乙方：<br />
10.1.1 甲方工作单位、居住地址、住所电话、手机号码、电子邮箱等；<br />
10.1.2 甲方家庭联系人或紧急联系人工作单位、居住地址、住所电话、手机号码等。<br />
10.2 因甲方不提供或不及时提供上述变更信息而导致乙方损失的，包括但不限于调查费用、仲裁费用、律师费用及差旅费用等，概由甲方承担。<br /></p>

<p align="left"><strong>第十一条 法律适用与管辖</strong><br />
11.1 本协议及其附件的签订、履行、终止、解释和争议解决均适用中国法律。<br />
    11.2 甲、乙、丙三方一致同意，如发生争议，三方应友好协商解决，协商不成的任意一方均有权向乙方住所地人民法院提起诉讼。<br /></p>

<p align="left"><strong>第十二条 征信及相关</strong><br />
12.1 甲方同意依法设立的征信机构将其在丙方平台上产生的信用信息，纳入各征信系统和征信中心的信用信息基础数据库，用于相关法律、法规、规章和规范性文件规定的用途；并同意乙方、丙方向征信机构查询甲方在各征信系统中的个人信用信息，
或通过征信机构向征信中心查询甲方的个人信用信息。<br />
12.2 甲方同意：在甲方违反本协议项下相关义务的，乙方、丙方有权将甲方的有关信息（包括但不限于甲方名称、地址、联系方式等）及违约行为通过任意媒介（包括但不限于乙方丙方网站、其他媒体、电话、传真等方式）向不特定的公众
（包括但不限于金融机构、媒体受众及甲方合作伙伴等）披露或告知，甲方已充分知悉并同意承担此等披露或告知行为可能带来的负面结果，乙方、丙方及其他信息发布方均不因此等披露或告知行为承担任何法律责任。<br />
12.3 乙方、丙方有权将甲方资料、信息、履约情况提供给第三方征信机构，以供有关单位、部门或个人依法查询和使用；乙方、丙方有权以通讯手段（包括但不限于：电话、短信、微信等各种通讯手段）告知甲方的亲属、利害关系人、
朋友甲方的欠款信息，并在乙方、丙方网站或其他媒体、网站上发布甲方的欠款信息，信息内容包括但不限于甲方的姓名、身份证号码、住址、工作单位、照片、欠款金额、逾期时间及违约责任等；将甲方违约失信相关信息向包括但不限于公安机关、
检察机关等司法机关、媒体、用人单位及有关逾期款项催收服务机构等披露而无需承担任何责任。<br /></p>

<p align="left"><strong>第十三条 其他</strong><br />
甲方确认：就乙方、丙方为甲方和出借人之间的借款事项提供的居间服务，甲方在此知悉并确认乙方、丙方并非甲方和出借人之间借款法律关系的一方，乙方、丙方对于甲方和出借人之间的借款事项不承担任何法律责任。<br />

<p align="left"><strong>第十四条 协议效力</strong><br />
14.1 本协议自甲方签字或盖章，乙方、丙方盖章后生效。 <br />
14.2 本协议及其附件的任何修改、补充均须以书面形式作出，补充协议与本协议具有同等法律效力。<br />
14.3 本协议的传真件、复印件和扫描件等有效复本的效力与本协议原件效力一致。<br />
14.4 本协议部分条款无效或不能履行，不影响其他条款的效力与履行。<br />
14.5 本协议一式三份，三方各执一份，均具有同等法律效力。<br /></p>


  （以下无正文） </p>
 
<div align="left" style="position: relative; top: -35px; left:0px; float: left;">    
    <p align="left">
甲方（签字）：<br /><br /><br />
乙方（盖章）：<br /><br /><br />
    </p>
</div>
<div style="clear:both">
	丙方（盖章）：<br /><br /><br />
</div>
</body>
</html>