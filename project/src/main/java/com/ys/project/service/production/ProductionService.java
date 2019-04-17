package com.ys.project.service.production;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ys.project.dao.production.ProductionMapper;
import com.ys.project.projectDTO.IndexProductionDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductionService implements IProductionService {

	private static final Logger log = LoggerFactory.getLogger(ProductionService.class);
	private ProductionMapper mapper;

	@Override
	public List<IndexProductionDTO> productionJoin() {
		// TODO Auto-generated method stub
		return mapper.productionJoin();
	}

}
