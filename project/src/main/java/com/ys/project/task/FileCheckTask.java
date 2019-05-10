package com.ys.project.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ys.project.dao.productionUpload.ProductionUploadMapper;
import com.ys.project.projectVO.Production_uploadVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

/*잘못된 파일을 스캔한다.*/

@Component // @Bean의 차이점은 개발자가 직접 컨트롤 하는 클래스 들에 대해서 @Component를 쓰게 해준다 .
@AllArgsConstructor
public class FileCheckTask {

	private static final Logger log = LoggerFactory.getLogger(FileCheckTask.class);
	@Setter(onMethod_ = { @Autowired })
	private ProductionUploadMapper uploadMapper;

	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.DATE, -1);

		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);

	}

	@Scheduled(cron = "* * 2 * * *")
	public void checkFiles(ServletRequest request) throws Exception {

		String path = request.getServletContext().getRealPath("/resources");

		log.warn("File Check Task rn .....");
		log.warn("" + new Date());

		// 데이터 베이스 파일 리스트 들
		List<Production_uploadVO> fileList = uploadMapper.getOldFiles();

		// 데이터 베이스에 있는 디렉토리 리스트 체크할 준비를 한다.
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get(path, vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());

		// 이미지 썸네일 파일도 가지고 있다.
		fileList.stream().map(vo -> Paths.get(path, "s_" + vo.getUuid() + "_" + vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));

		log.warn("============= 디비에서 가지고 온 파일에 대한 정보(하루전 날 데이터 형태를 들고온다.uplodaPath - 1기준 ================"
				+ "업로드 된 원본 사진들과 "
				+ "업로드 된 섬네일 사진들 ===============");

		fileListPaths.forEach(p -> log.warn("" + p));

		// 어제 디렉토리
		File targetDir = Paths.get(path, getFolderYesterDay()).toFile();

		// 리얼 패스를 통해 어제 디렉토리 파일을을 배열 값으로 담는다
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

		log.warn("======================================");

		for (File file : removeFiles) {
			log.warn("이거 앱솔루트 패스 " + file.getAbsolutePath());
			file.delete();
		}

	}

}
