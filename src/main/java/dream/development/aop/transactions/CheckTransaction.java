package dream.development.aop.transactions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionSynchronizationManager;

@Component
public class CheckTransaction {

	private static final Logger logger = LoggerFactory.getLogger(CheckTransaction.class);

	public void checkTransactionActive() {

        logger.info("Transaction open status is " + TransactionSynchronizationManager.isActualTransactionActive());

	}

}
