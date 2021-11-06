package model.ordHistory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderHistoryService")
public class OrdHistoryServiceImpl implements OrdHistoryService{
	
	@Autowired
	private OrdHistoryDAO ordHistoryDAO;

	@Override
	public void insertOrdHistory(OrdHistoryVO vo) {
		ordHistoryDAO.insertOrdHistory(vo);
		
	}

	@Override
	public void deleteOrdHistory(OrdHistoryVO vo) {
		ordHistoryDAO.deleteOrdHistory(vo);
	}

	@Override
	public OrdHistoryVO getOrdHistory(OrdHistoryVO vo) {
		return ordHistoryDAO.getOrdHistory(vo);
	}

	@Override
	public List<OrdHistoryVO> getMyOrdList(OrdHistoryVO vo) {
		return ordHistoryDAO.getMyOrdList(vo);
	}

	@Override
	public List<OrdHistoryVO> getOrdHistoryList(OrdHistoryVO vo) {
		return ordHistoryDAO.getOrdHistoryList(vo);
	}

	@Override
	public void updateOrdHistroy(OrdHistoryVO vo) {
		ordHistoryDAO.updateOrdHistroy(vo);
		
	}

}
