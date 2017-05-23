package com.tera.batch.cleanmatch.processor;

import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.springframework.batch.item.ItemProcessor;

import com.tera.batch.errorLog.dao.BatchErrorLogDao;
import com.tera.batch.errorLog.model.BatchErrorLog;
import com.tera.match.dao.MatchResultDao;
import com.tera.match.model.Lend2match;
import com.tera.match.model.MatchResult;
import com.tera.match.service.MatchResultService;
import com.tera.payment.service.LoanRepayPlanService;

public class CleanMatchProcessor implements ItemProcessor<Integer, String> {

	/**
	 * 日志
	 */
	private final static Logger log = Logger.getLogger(CleanMatchProcessor.class);
    
    private MatchResultDao<MatchResult> daoMatch;
    
    private MatchResultService<MatchResult> matchResultService;
    
    private LoanRepayPlanService loanRepayPlanService;
    
    private BatchErrorLogDao<BatchErrorLog> batchErrorLogDao;
	/**
     * 对取到的数据进行简单的处理。
     * 
     * @param student
     *            处理前的数据。
     * @return 处理后的数据。
     * @exception Exception
     *                处理是发生的任何异常。
     */
    @Override
    public String process(Integer lm) throws Exception {
    	try {
    		matchResultService.clearMatchResult();
        	return null;
			
		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
			BatchErrorLog errorLog=new BatchErrorLog();
			errorLog.setErrorMsg(e.getMessage());
			errorLog.setJobName("cleanMatchJob");
			errorLog.setCreateTime(new Timestamp(System.currentTimeMillis()));
			batchErrorLogDao.add(errorLog);
			throw e;
		}
    }
    
    
	public MatchResultService<MatchResult> getMatchResultService() {
		return matchResultService;
	}


	public void setMatchResultService(
			MatchResultService<MatchResult> matchResultService) {
		this.matchResultService = matchResultService;
	}



	public MatchResultDao<MatchResult> getDaoMatch() {
		return daoMatch;
	}
	public void setDaoMatch(MatchResultDao<MatchResult> daoMatch) {
		this.daoMatch = daoMatch;
	}


	public LoanRepayPlanService getLoanRepayPlanService() {
		return loanRepayPlanService;
	}


	public void setLoanRepayPlanService(LoanRepayPlanService loanRepayPlanService) {
		this.loanRepayPlanService = loanRepayPlanService;
	}


	public BatchErrorLogDao<BatchErrorLog> getBatchErrorLogDao() {
		return batchErrorLogDao;
	}


	public void setBatchErrorLogDao(BatchErrorLogDao<BatchErrorLog> batchErrorLogDao) {
		this.batchErrorLogDao = batchErrorLogDao;
	}
	
	
	
}
