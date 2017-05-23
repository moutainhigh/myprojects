package com.tera.audit.account.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.tera.audit.account.model.form.AccountFormBean;
import com.tera.audit.account.model.form.OnLineLoanQBean;
import com.tera.audit.account.service.IOnLineService;
import com.tera.audit.law.model.Contract;
import com.tera.audit.law.service.IContractService;
import com.tera.audit.loan.model.LoanBase;
import com.tera.audit.loan.service.ILoanBaseService;
import com.tera.feature.lenduser.model.LendUser;
import com.tera.feature.lenduser.service.ILendUserService;
import com.tera.sys.constant.SysConstants;
import com.tera.sys.controller.BaseController;
import com.tera.sys.model.JsonMsg;
import com.tera.sys.model.Org;
import com.tera.sys.model.PageModel;
import com.tera.util.JsonUtil;
import com.tera.util.ObjectUtils;
import com.tera.util.RequestUtils;

/** 线上放款Controller
 * @author QYANZE
 *
 */
@Controller
@RequestMapping("/account/online")
public class OnLineLoanController extends BaseController {

	private final static Logger log = Logger.getLogger(OnLineLoanController.class);
	
	@Autowired(required=false) //自动注入
	private ILoanBaseService loanBaseService;
	@Autowired
	private IContractService contractService;
	@Autowired
	private IOnLineService onLineService;
	@Autowired
	private ILendUserService lendUserService;
	
	/**
	 * 跳转到线上放款的查询条件页面
	 * @param request
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/query.do")
	public String onlineQuery(HttpServletRequest request, ModelMap map) throws Exception {
		String thisMethodName = Thread.currentThread().getStackTrace()[1].getMethodName();
		log.info(thisMethodName+":start");
		log.info(thisMethodName+":end");
		return "account/online/onLineQuery";
	}
	
	/**
	 * 跳转到线上放款的列表页面
	 * @param request
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list.do")
	public String onlineList(HttpServletRequest request, ModelMap map) throws Exception {
		String thisMethodName = Thread.currentThread().getStackTrace()[1].getMethodName();
		log.info(thisMethodName+":start");
		
//		User loginUser = (User) request.getSession().getAttribute(SysConstants.LOGIN_USER);
//		Org loginOrg = (Org) request.getSession().getAttribute(SysConstants.LOGIN_ORG);
		
		PageModel pm = new PageModel();
		Object bean = RequestUtils.getRequestBean(OnLineLoanQBean.class, request);
		Map<String, Object> queryMap = ObjectUtils.describe(bean);
		
//		queryMap.put("bpmStates", new String[]{CommonConstant.PROCESS_J});
//		queryMap.put("loanWays", new String[]{Contract.LOAN_WAY_ZQ,Contract.LOAN_WAY_ZT}); // 线上
//		if (0 == loginUser.getIsAdmin()) {
//			queryMap.put("processer", loginUser.getLoginId());
//			queryMap.put("orgId", loginOrg.getOrgId());
//		}
		
		pm.init(request, null, bean);
		queryMap.put("curPage", pm.getCurPage());
		queryMap.put("pageSize", pm.getPageSize());
		PageList<OnLineLoanQBean> onlineList = this.onLineService.queryPageList(queryMap);
		pm.setData(onlineList);
		pm.initRowsCount(onlineList.getPaginator().getTotalCount());
		map.put("pm", pm);
		log.info(thisMethodName+":end");
		return "account/online/onLineList";
	}
	
	@RequestMapping("/update.do")
	public String onlineUpdate(Integer id,String contractId,String onLineAmt, String onLineContractId,HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception {
		String thisMethodName = Thread.currentThread().getStackTrace()[1].getMethodName();
		log.info(thisMethodName+":start");
		LoanBase loanBase = null;
		Contract contract = null;
		//如果存在
		if (id != null && 0 != id) {
			loanBase  = this.loanBaseService.queryByKey(id);
			contract = this.contractService.queryByContractId(contractId);
			
			// 续贷
			if ("1".equals(loanBase.getIsRenew())) {
				LoanBase origLoanBase = this.loanBaseService.queryByLoanId(loanBase.getOrigLoanId());
				map.put("origLoanBase", origLoanBase);
				map.put("isTgth", origLoanBase.getIsTgth());
			} else {
				map.put("isTgth", loanBase.getIsTgth());
			}
		}
		map.put("loanBase", loanBase);
		map.put("contract", contract);
		map.put("onLineAmt", onLineAmt);
		map.put("onLineContractId", onLineContractId);
		
		LendUser lendUser = null;
		// 债权转让
		if ("2".equals(contract.getGetLoanWay())) {
			lendUser = this.lendUserService.queryByKey(contract.getLendUserId());
		}
		map.put("lendUser", lendUser);
		
		// 影像资料场景类型
		// 个人
		if ("01".equals(loanBase.getLoanType())) {
			map.put("sec","filesce1");
		}
		// 公司
		if ("02".equals(loanBase.getLoanType())) {
			map.put("sec","filesce2");
		}
		log.info(thisMethodName+":end");
		return "account/online/onLineUpdate";
	}
	
	@RequestMapping("/save.do")
	public void onlineSave(HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception  {
		String thisMethodName = Thread.currentThread().getStackTrace()[1].getMethodName();
		log.info(thisMethodName+":start");
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		String loginId = (String) request.getSession().getAttribute(SysConstants.LOGIN_ID);
		Org loginOrg = (Org) request.getSession().getAttribute(SysConstants.LOGIN_ORG);
		
		try {
			AccountFormBean bean = (AccountFormBean) RequestUtils.getRequestBean(AccountFormBean.class, request);
			JsonMsg jsonMsg = this.onLineService.operateProcess(bean,loginId,loginOrg.getOrgId());
			writer.print(JsonUtil.object2json(jsonMsg));
		} catch (Exception e) {
			log.error(thisMethodName+":error", e);
			writer.print(JsonUtil.object2json(new JsonMsg(false, "失败")));
			writer.flush();
			writer.close();
			throw e;
		}
		writer.flush();
		writer.close();
		log.info(thisMethodName+":end");
	}
}
