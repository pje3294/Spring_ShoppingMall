package model.ordHistory;

import java.util.List;

public interface OrdHistoryService {
	void insertOrdHistory(OrdHistoryVO vo);
	void deleteOrdHistory(OrdHistoryVO vo);
	void updateOrdHistroy(OrdHistoryVO vo);
	OrdHistoryVO getOrdHistory(OrdHistoryVO vo);
	List<OrdHistoryVO> getMyOrdList(OrdHistoryVO vo);
	List<OrdHistoryVO> getOrdHistoryList(OrdHistoryVO vo);
}
